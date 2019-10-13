import 'package:flutter/material.dart';
import 'package:mo17/src/ui/login/LoginScreen.dart';
import 'package:mo17/src/ui/uitslagen/UitslagenScreen.dart';
import 'package:mo17/src/ui/home/HomeScreen.dart';

void main() => runApp(
      MaterialApp(
        initialRoute: '/home',
        routes: {
          // First screen
          '/': (context) => HomeScreen(),
          // '/login': (context) => LoginScreen(),
          '/uitslagen' : (context) => UitslagenScreen(),
          '/home' : (context) => HomeScreen(),
        },
      ),
    );