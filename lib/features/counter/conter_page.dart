import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:my_flutter_app/main_screen.dart';
import 'package:my_flutter_app/core/stores/counter_store.dart';
import 'package:provider/provider.dart';
import 'counter_screen.dart';
import 'package:my_flutter_app/widgets/loading_widget.dart';

class CounterPage extends StatefulWidget {
  @override
  _CounterPageState createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  late CounterStore counterStore;
  late Future<void> loadDataFuture;

  @override
  void initState() {
    super.initState();
    counterStore = Provider.of<CounterStore>(context, listen: false);
    loadDataFuture = counterStore.loadCounter(); // โหลดข้อมูลก่อนแสดง UI
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: loadDataFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return LoadingWidget(message: "กำลังโหลดหน้าจอ...");
        }
        return MainScreen(
          currentIndex: 2,
          appBar: AppBar(
            title: Text("Counter Page", style: TextStyle(color: Colors.white)),
            backgroundColor: Colors.blueAccent,
          ),
          child: Scaffold(
            body: Observer(
              builder: (_) => CounterScreen(counterStore: counterStore),
            ),
          ),
        );
      },
    );
  }
}
