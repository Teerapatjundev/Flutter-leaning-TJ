import 'package:flutter/material.dart';
import 'package:my_flutter_app/core/stores/counter_store.dart';
import 'package:provider/provider.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'core/routes/app_routes.dart';
import 'config/config.dart';

Future<void> main() async {
  
  sqfliteFfiInit();
  databaseFactory = databaseFactoryFfi;

   const String environment =
      String.fromEnvironment('ENVIRONMENT', defaultValue: 'local');

  await Config().loadConfig(environment);

  runApp(
    MultiProvider(
      providers: [Provider<CounterStore>(create: (_) => CounterStore())],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: ''),
      initialRoute: AppRoutes.home,
      routes: AppRoutes.routes,
    );
  }
}
