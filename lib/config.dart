import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mo17/src/utils/theme/index.dart';

class AppConfig extends InheritedWidget {

  static String url = "https://script.google.com/macros/s/AKfycbz5QCQMy6txdonWM5FG_z2UH9xWVreBYP1lQ-KndEwTi6v4cS60/exec?key=rockandroll&format=json&blad="; 
  final String urlVervoer = url + "Rijlijst";
  final String urlNieuws = url + "Nieuws";
  final String urlStand = url + "StandVJ";
  final String urlStandNJ = url + "Stand";
  final String urlScore = url + "Scores";
  final String urlUitslagen = url + "CompVJ";
  final String urlUitslagenNJ = url + "CompNJ";

  AppConfig({ Widget child }) : super(child: child);

  Widget appBarTitle(String title) {
    return new Stack(
            children: <Widget>[
                Image.asset(PATH_CVV_BACKGROUND, 
                fit: BoxFit.fill, 
                width: double.infinity,
                height: 55,
                //alignment: Alignment.center
              ),
              new Center(
                child: Padding(
                    child: Text(title, style: TextStyle(color: Colors.pink, fontSize: 24)),
                    padding: EdgeInsets.fromLTRB(0, 15, 0, 0)
                  )
                ) 
            ],
          );
  }

  Future<String> getData(String url) async {
    var response = await http.get(url);
    return response.body;
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static AppConfig of(BuildContext context) => 
    context.dependOnInheritedWidgetOfExactType<AppConfig>();
}