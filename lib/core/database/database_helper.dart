import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class DatabaseHelper {
  static Database? _database;
  static const String tableName = 'counter';
  static const String columnId = 'id';
  static const String columnValue = 'value';

  static Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB();
    return _database!;
  }

  static Future<Database> _initDB() async {
    // ✅ Store the database inside the Flutter project folder
    final projectDir = Directory.current.path;
    final dbDir = Directory(join(projectDir, 'db'));

    // ✅ Ensure the directory exists
    if (!dbDir.existsSync()) {
      dbDir.createSync(recursive: true);
    }

    print("==========================================");
    print(dbDir.path);
    final path = join(dbDir.path, 'counter_database.db');

    return await databaseFactoryFfi.openDatabase(path,
        options: OpenDatabaseOptions(
          version: 1,
          onCreate: (db, version) async {
            await db.execute('''
              CREATE TABLE $tableName(
                $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
                $columnValue INTEGER
              )
            ''');
          },
        ));
  }

  /// Insert a counter value into the database
  static Future<void> insertCounter(int value) async {
    final db = await database;
    await db.insert(tableName, {columnValue: value});
  }

  /// Fetch the latest counter value (last saved)
  static Future<int> fetchLatestCounter() async {
    final db = await database;
    final result =
        await db.query(tableName, orderBy: '$columnId DESC', limit: 1);
    if (result.isNotEmpty) {
      return result.first[columnValue] as int;
    }
    return 0; // Default value if no counter is saved
  }

  /// Fetch all saved counters as a list
  static Future<List<Map<String, dynamic>>> fetchAllCounters() async {
    final db = await database;
    return await db.query(tableName, orderBy: '$columnId DESC');
  }

  /// Update an existing counter
  static Future<void> updateCounter(int id, int newValue) async {
    final db = await database;
    await db.update(
      tableName,
      {columnValue: newValue},
      where: '$columnId = ?',
      whereArgs: [id],
    );
  }

  /// Delete a counter from the database
  static Future<void> deleteCounter(int id) async {
    final db = await database;
    await db.delete(
      tableName,
      where: '$columnId = ?',
      whereArgs: [id],
    );
  }
}
