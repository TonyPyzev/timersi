import 'package:flutter/material.dart';
import 'package:timersi/application/screens/home/home_screen.dart';
import 'package:timersi/application/screens/timer/timer_screen.dart';

class Navigation {
  static const String initialRoute = HomeScreen.pageRoute;

  static final Map<String, Widget Function(BuildContext)> routes = {
    HomeScreen.pageRoute: (context) => const HomeScreen(),
    TimerScreen.pageRoute: (context) => const TimerScreen(),
  };
}
