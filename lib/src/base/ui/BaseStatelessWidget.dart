import "package:flutter/material.dart";
import 'package:mo17/src/utils/theme/ThemeBase.dart';

abstract class BaseStatelessWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: GestureDetector(
        onTap: () {
          // Disable keyboard when tap anywhere outside Text feild
          FocusScope.of(context).autofocus(FocusNode());
        },
        child: Scaffold(
          key: onInitKey(context),
          appBar: onInitAppBar(context),
          body: onInitBody(context),
          floatingActionButton: onInitFloatingActionButton(context),
          drawer: onInitDrawer(context),
          endDrawer: onInitEndDrawer(context),
          bottomNavigationBar: onInitBottomNavigationBar(context),
          bottomSheet: onInitBottomSheet(context),
          backgroundColor: Colors.transparent,
          resizeToAvoidBottomPadding: setResizeToAvoidBottomPadding(context),
          primary: setPrimary(context),
        ),
      ),
    );
  }

  // Title widget
  String initTitle() {
    return null;
  }

  ///Widget key
  Key onInitKey(BuildContext context) {
    return null;
  }

  /// Appbar widget
  Widget onInitAppBar(BuildContext context) {
    return AppBar(
      leading: _initLeading(context),
      title: const Text('CVV Berkel MO17-1'),
      // actions: <Widget>[
      //   IconButton(
      //       icon: const Icon(Icons.add_alert),
      //       tooltip: 'Show Snackbar',
      //       onPressed: () {
      //         //scaffoldKey.currentState.showSnackBar(snackBar);
      //       },
      //     ),
      // ],
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

  /// Body widget
  Widget onInitBody(BuildContext context) {
    return null;
  }

  /// Floating action button widget
  Widget onInitFloatingActionButton(BuildContext context) {
    return null;
  }

  /// Drawer menu widget
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
                    child : Center(child : Text('CVV Berkel',
                      style : TextStyle(color : Colors.white, fontSize : 24)
                    ))
                  ),
                  subtitle : Center(child : Text('MO17-1',
                    style : TextStyle(color : Colors.white, fontSize : 16)
                  ))
                )
              )
            ),
            drawerItem(context, Icons.view_headline, "Nieuws", "/home"),
            drawerItem(context, Icons.table_chart, "Uitslagen", "/uitslagen"),
            drawerItem(context, Icons.filter_list, "Stand", "/stand"),
            drawerItem(context, Icons.local_activity, "Scores", "/score"),
            drawerItem(context, Icons.local_taxi, "Vervoerslijst", "/vervoer"),
            Divider(height: 2.0, thickness: 2,),
            drawerItem(context, Icons.table_chart, "Uitslagen Najaar", "/uitslagennj"),
            drawerItem(context, Icons.filter_list, "Eindstand Najaar", "/standnj"),
        ],
      ),
    );
}

  /// End Drawer widget
  Widget onInitEndDrawer(BuildContext context) {
    return null;
  }

  /// Bottom Navigation Bar widget
  Widget onInitBottomNavigationBar(BuildContext context) {
    return null;
  }

  /// Bottom sheet widget
  Widget onInitBottomSheet(BuildContext context) {
    return null;
  }

  /// Set Resize to avoid bottom padding
  bool setResizeToAvoidBottomPadding(BuildContext context) {
    return true;
  }

  /// Set primary
  bool setPrimary(BuildContext context) {
    return true;
  }

  BoxDecoration initDecoration(BuildContext context) {
    return null;
  }

  /// Start screen
  dynamic pushScreen(BuildContext context, String screenName) async {
    return await Navigator.pushNamed(context, screenName);
  }

  /// Start with replacement screen
  dynamic pushReplaceScreen(BuildContext context, String screenName) async {
    return await Navigator.pushReplacementNamed(context, screenName);
  }

  /// Back screen.
  void popScreen(BuildContext context, {dynamic data}) {
    if (data == null) {
      Navigator.pop(context);
    } else {
      Navigator.pop(context, data);
    }
  }

  Widget drawerItem(BuildContext context, 
                    IconData icon,
                    String menuItem,
                    String link) {
    return  Padding(padding : EdgeInsets.fromLTRB(0, 5, 0, 0),
              child : ListTile(
                leading : Icon(icon),
                title : Text(menuItem),
                onTap: () {
                  // Navigate to new screen, ensuring all others except Home are removed from navigation.
                  Navigator.of(context).pushNamedAndRemoveUntil(link, ModalRoute.withName("/"));
                }
              )
            );
  }
}
