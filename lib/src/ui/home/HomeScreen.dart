import 'package:apptemplates/src/models/NieuwsBericht.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:apptemplates/src/base/ui/BaseStatelessWidget.dart';
import 'package:apptemplates/src/utils/theme/index.dart';
import 'package:http/http.dart' as http;


class HomeScreen extends BaseStatelessWidget{

  int currentTabPage = 0 ;

  /// App bar includes: 
  /// leading: Icon drawer menu 
  /// [optional] actions list : right side
  @override 
  Widget onInitAppBar(BuildContext context){
    return AppBar(
      leading: _initLeading(context),
      title: const Text('CVV Berkel MO17-1'),
      actions: <Widget>[
        IconButton(
            icon: const Icon(Icons.add_alert),
            tooltip: 'Show Snackbar',
            onPressed: () {
              //scaffoldKey.currentState.showSnackBar(snackBar);
            },
          ),
      ],
    );
  }

  @override
  Widget onInitDrawer(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
            // Header.
            Container(
              decoration : BoxDecoration(
                color: Colors.indigo,
              ),
              child : Padding(padding : EdgeInsets.fromLTRB(0, 30, 0, 15),
                child : ListTile(
                  title : Padding(padding : EdgeInsets.fromLTRB(0, 0, 0, 20),
                    child : Center(child : Text('Nieuws',
                      style : TextStyle(color : Colors.white, fontSize : 24)
                    ))
                  ),
                  subtitle : Center(child : Text('Laatste berichten',
                    style : TextStyle(color : Colors.white, fontSize : 16)
                  )),
                  onTap: () {
                    Navigator.of(context).pushNamedAndRemoveUntil("/home", ModalRoute.withName("/"));
                  },
                )
              )
            ),
            // Lobby (room list).
            // Padding(padding : EdgeInsets.fromLTRB(0, 20, 0, 0),
            //   child : ListTile(
            //     leading : Icon(Icons.list),
            //     title : Text("Lobby"),
            //     onTap: () {
            //       // Navigate to new screen, ensuring all others except Home are removed from navigation.
            //       Navigator.of(inContext).pushNamedAndRemoveUntil("/Lobby", ModalRoute.withName("/"));
            //     // Call server to get room list.
            //     connector.listRooms((inRoomList) {
            //       print("## AppDrawer.listRooms: callback: inRoomList=$inRoomList");
            //       // Update the model with the new list of rooms.
            //       model.setRoomList(inRoomList);
            //     });
            //     }
            //   )
            // ),

        ],
      ),
    );
  }

  /// Drawer icon
  Widget _initLeading(BuildContext context){
    return Builder(
      builder: (BuildContext context){
        return IconButton(
          icon: Image.asset(PATH_ICON_MENU),
          onPressed: (){
            print("On pressed icon drawer menu");
            Scaffold.of(context).openDrawer();
          },
        );
      },
    );
  }

 
  /// Body of screen
  /// include : 
  /// Bottom tab navigation bar 
  /// Drawer menu
  /// Header with action if need 
  @override
  Widget onInitBody(BuildContext context) {
    return FutureBuilder<List<NieuwsBericht>> (
      future: getData(),
      builder: (context, nieuws) {
        return Container(
          decoration: backgroundDecoration,
          child: Column(
            children: <Widget>[

            ],
          ),
        );
      }
    );
  }

  Future<List<NieuwsBericht>> getData() async {
    var response = await http.get(
      Uri.encodeFull("https://script.google.com/macros/s/AKfycbz5QCQMy6txdonWM5FG_z2UH9xWVreBYP1lQ-KndEwTi6v4cS60/exec?key=rockandroll&blad=Nieuws&format=json"),
      /*headers: {"Accept": "application/json"}*/);

    final nieuwsBerichten = nieuwsBerichtFromJson(response.body);

    return nieuwsBerichten;
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