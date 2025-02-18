import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:my_flutter_app/main_screen.dart';
import 'package:my_flutter_app/core/stores/counter_store.dart';
import 'package:provider/provider.dart';
import 'home_screen.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final counterStore = Provider.of<CounterStore>(context);

    return MainScreen(
      currentIndex: 0,
      child: Scaffold(
        body: Observer(
          builder:
              (_) => HomeScreen(
                count: counterStore.count,
                onIncrement: () => counterStore.increment(),
                onDecrement: () => counterStore.decrement(),
                onSaveCounter: () => counterStore.saveCounter(),
              ),
        ),
      ),
    );
  }
}
