import 'package:flutter/material.dart';
import 'package:mo17/src/ui/login/LoginScreen.dart';
import 'package:mo17/src/ui/register/RegisterScreen.dart';
import 'package:mo17/src/ui/home/HomeScreen.dart';

void main() => runApp(
      MaterialApp(
        initialRoute: '/home',
        routes: {
          // First screen
          '/': (context) => RegisterScreen(),
          '/login': (context) => LoginScreen(),
          '/register' : (context) => RegisterScreen(),
          '/home' : (context) => HomeScreen(),
        },
      ),
    );