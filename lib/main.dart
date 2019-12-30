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
        '/stand' : (context) => StandScreen(AppConfig.of(context).urlStand, 'STAND'),
        '/standnj' : (context) => StandScreen(AppConfig.of(context).urlStandNJ, 'STAND NAJAAR'),
        '/uitslagen' : (context) => UitslagenScreen(AppConfig.of(context).urlUitslagen, 'UITSLAGEN'),
        '/uitslagennj' : (context) => UitslagenScreen(AppConfig.of(context).urlUitslagenNJ, 'UITSLAGEN NAJAAR'),
        '/home' : (context) => HomeScreen(),
        '/score' : (context) => ScoreScreen(),
        '/vervoer' : (context) => VervoerScreen()
      },
    )
  );
}