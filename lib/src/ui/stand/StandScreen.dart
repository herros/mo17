import 'package:mo17/src/models/Stand.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:mo17/src/base/ui/BaseStatelessWidget.dart';
import 'package:http/http.dart' as http;
import 'package:mo17/src/utils/theme/index.dart';


class StandScreen extends BaseStatelessWidget{

  final String urlNews = "https://script.google.com/macros/s/AKfycbz5QCQMy6txdonWM5FG_z2UH9xWVreBYP1lQ-KndEwTi6v4cS60/exec?key=rockandroll&format=json&blad=Stand";

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
                child: Text('STAND', style: TextStyle(color: Colors.pink, fontSize: 24),))
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
    return response.body;
  }

  Widget createListView(BuildContext context, AsyncSnapshot posities) {
    List<Stand> lijst = standFromJson(posities.data);
    var kop =
      new Padding(
        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
        child: 
          new Column(
            children: 
              <Widget>[
                new Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    createHeader('Team', 6, CrossAxisAlignment.start),
                    createHeader('Punten', 2, CrossAxisAlignment.center),
                    createHeader('Doelsaldo', 2, CrossAxisAlignment.center)
                    ]
                  )
                ]
            )
      ); 

    return new ListView.builder(
      itemCount: lijst.length+1,
      itemBuilder: (BuildContext context, int index) {
        if (index == 0) return kop;
        index -= 1;
        return 
          new Padding(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: 
              new Column(
                children: <Widget>[
                    new Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      createField(
                        (index+1).toString() +
                        '. ' + 
                        lijst[index].team, 6, CrossAxisAlignment.start),
                      createField(
                        lijst[index].g.toString() + 
                        '-' + 
                        lijst[index].p.toString(), 2, CrossAxisAlignment.center),
                      createField(
                        lijst[index].dv.toString() +
                        '-' +
                        lijst[index].dt.toString(), 2, CrossAxisAlignment.center),
                    ]
                  )
                ]
              )
            );
      }
    );
  }

  Widget createHeader(field, width, align) {
    return createField(field, width, align, true);
  }

  Widget createField(String field, width, align, [header = false]) {
    var ts = (header) || field.indexOf("Berkel") > -1 ? 
            new TextStyle(fontWeight: FontWeight.bold, color: Colors.blue, fontSize: 16) :
            new TextStyle(fontWeight: FontWeight.normal, color: Colors.blue, fontSize: 16);
    return new Expanded(
        flex: width,
        child: new Column(
          crossAxisAlignment: align,
          children: <Widget>[
            new Text(field, textScaleFactor: 1.0, style: ts)
          ],
        ),
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