import 'package:flutter/material.dart';
import 'package:mo17/config.dart';
import 'package:mo17/src/ui/stand/StandScreen.dart';
import 'package:mo17/src/ui/home/HomeScreen.dart';
import 'package:mo17/src/ui/score/ScoreScreen.dart';
import 'package:mo17/src/ui/uitslagen/UitslagenScreen.dart';
import 'package:mo17/src/ui/vervoer/VervoerScreen.dart';

void main() => runApp(startUp());
 
Widget startUp() {
  return AppConfig(
    child: MaterialApp(
      initialRoute: '/home',
      routes: {
        // First screen
        '/': (context) => HomeScreen(),
        '/stand' : (context) => StandScreen(),
        '/uitslagen' : (context) => UitslagenScreen(),
        '/home' : (context) => HomeScreen(),
        '/score' : (context) => ScoreScreen(),
        '/vervoer' : (context) => VervoerScreen()
      },
    )
  );
}