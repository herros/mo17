import 'package:flutter/material.dart';
import 'package:apptemplates/src/ui/login/LoginScreen.dart';
import 'package:apptemplates/src/ui/register/RegisterScreen.dart';
import 'package:apptemplates/src/ui/home/HomeScreen.dart';

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