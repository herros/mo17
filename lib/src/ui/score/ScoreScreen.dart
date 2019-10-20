import 'package:mo17/src/models/Score.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:mo17/src/base/ui/BaseStatelessWidget.dart';
import 'package:http/http.dart' as http;
import 'package:mo17/src/utils/theme/index.dart';


class ScoreScreen extends BaseStatelessWidget{

  final String urlNews = "https://script.google.com/macros/s/AKfycbz5QCQMy6txdonWM5FG_z2UH9xWVreBYP1lQ-KndEwTi6v4cS60/exec?key=rockandroll&format=json&blad=Scores";

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
                child: Text('SCORELIJST', style: TextStyle(color: Colors.pink, fontSize: 24),))
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

  Widget createListView(BuildContext context, AsyncSnapshot snapshot) {
    List<Score> lijst = scoreFromJson(snapshot.data);
    var kop =
      new Padding(
        padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
        child: 
          new Column(
            children: 
              <Widget>[
                new Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    createHeader('Naam', 4, CrossAxisAlignment.start),
                    createHeader('Goals', 2, CrossAxisAlignment.center),
                    createHeader('Assists', 2, CrossAxisAlignment.center),
                    createHeader('Totaal', 2, CrossAxisAlignment.center)
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
          padding: EdgeInsets.fromLTRB(15,5, 15, 0),
            child: 
              new Column(
                children: <Widget>[
                      new Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          createField(
                            (index+1).toString() +
                            '. ' + 
                            lijst[index].name, CrossAxisAlignment.start, 4),
                          createField(
                            lijst[index].goals.toString(), CrossAxisAlignment.center, 2),
                          createField(
                            lijst[index].assists.toString(), CrossAxisAlignment.center, 2),
                          createField(
                            lijst[index].total.toString(), CrossAxisAlignment.center, 2)
                        ]
                      )
                  ]
                )
        );
      }
    );
  }

  Widget createHeader(field, width, align) {
    return createField(field, align, width, true);
  }
  
  Widget createField(field, align, width, [header = false]) {
    var ts = (header) ? 
                new TextStyle(fontWeight: FontWeight.bold, color: Colors.blue, fontSize: 16) :
                new TextStyle(fontWeight: FontWeight.normal, color: Colors.blue, fontSize: 16);
    return new Expanded(
        flex: width,
        child: new Column(
          crossAxisAlignment: align,
          children: <Widget>[
            new Text(field, style: ts)
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