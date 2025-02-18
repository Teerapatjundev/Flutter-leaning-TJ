import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:my_flutter_app/main_screen.dart';
import 'package:my_flutter_app/core/stores/counter_store.dart';
import 'profile_screen.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final CounterStore counterStore = CounterStore();

  @override
  Widget build(BuildContext context) {
    return MainScreen(
      currentIndex: 1,
      child: Scaffold(body: Observer(builder: (_) => ProfileScreen())),
    );
  }
}
