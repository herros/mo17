import 'package:mo17/src/models/Uitslag.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:mo17/src/base/ui/BaseStatelessWidget.dart';
import 'package:http/http.dart' as http;
import 'package:mo17/src/utils/theme/index.dart';


class UitslagenScreen extends BaseStatelessWidget{

  final String urlNews = "https://script.google.com/macros/s/AKfycbz5QCQMy6txdonWM5FG_z2UH9xWVreBYP1lQ-KndEwTi6v4cS60/exec?key=rockandroll&format=json&blad=CompNJ";

  /// Body of screen
  /// include : 
  /// Bottom tab navigation bar 
  /// Drawer menu
  /// Header with action if need 
  @override
  Widget onInitBody(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0.0,
        title: 
          new Stack(
            children: <Widget>[
             Image.asset(PATH_CVV_BACKGROUND, 
              fit: BoxFit.fill, 
              width: double.infinity,
              height: double.infinity,
              alignment: Alignment.center),
              new Center(
                child: Text('UITSLAGEN', style: TextStyle(color: Colors.pink, fontSize: 24),))
            ],
          )
      ),
      body: Container(
        child: 
          new FutureBuilder<String> (
          future: getData(),
          builder: (context, nieuws) {
            switch (nieuws.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
                return new Center(child: new CircularProgressIndicator());
              default:
                if (nieuws.hasError)
                  return new Text('Error: ${nieuws.error}');
                else
                  return createListView(context, nieuws);
            }
          }
        )
      )
    );
  }

  Future<String> getData() async {
    var response = await http.get(urlNews);
      // ,
      // /*headers: {"Accept": "application/json"}*/);
    return response.body;
  }

  Widget createListView(BuildContext context, AsyncSnapshot uitslagen) {
    List<Uitslag> lijst = uitslagFromJson(uitslagen.data);
    return new ListView.builder(
      itemCount: lijst.length,
      itemBuilder: (BuildContext context, int index) {
        return new Column(
          children: <Widget>[
            new ListTile(
              subtitle: new Text(lijst[index].datum),
              title: new Text(
                lijst[index].home,
                style: TextStyle(color: Colors.blue, fontSize: 18),
                ),
            ),
            new Divider(height: 2.0,),
            ],
          );
        },
    );
  }

   /// Bottom nav
  // @override
  // Widget onInitBottomNavigationBar(BuildContext context){
  //   return FancyBottomNavigation(
  //     tabs: [
  //       TabData(iconData: ),
  //       TabData(),
  //     ],

  //   );
  // }
}