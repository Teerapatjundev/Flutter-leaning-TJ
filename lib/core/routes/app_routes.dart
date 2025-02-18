import 'package:flutter/material.dart';
import 'package:my_flutter_app/features/counter/conter_page.dart';
import 'package:my_flutter_app/features/home/home_page.dart';
import 'package:my_flutter_app/features/profile/profile_page.dart';

class AppRoutes {
  static const String home = '/';
  static const String profile = '/profile';
  static const String counter = '/counter';

  static Map<String, WidgetBuilder> routes = {
    home: (context) => HomePage(),
    profile: (context) => ProfilePage(),
    counter: (context) => CounterPage(),
  };
}
