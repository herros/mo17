import 'package:mo17/config.dart';
import 'package:mo17/src/models/NieuwsBericht.dart';
import 'package:flutter/material.dart';
import 'package:mo17/src/base/ui/BaseStatelessWidget.dart';

class HomeScreen extends BaseStatelessWidget{

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
        title: AppConfig.of(context).appBarTitle('NIEUWS') 
      ),
      body: Container(
        child: 
          new FutureBuilder<String> (
          future: AppConfig.of(context).getData(AppConfig.of(context).urlNieuws),
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

  Widget createListView(BuildContext context, AsyncSnapshot nieuws) {
    List<NieuwsBericht> lijst = nieuwsBerichtFromJson(nieuws.data);
    return new ListView.builder(
      itemCount: lijst.length,
      itemBuilder: (BuildContext context, int index) {
        return new Column(
          children: <Widget>[
            new ListTile(
              subtitle: new Text(lijst[index].datum),
              title: new Text(
                lijst[index].text,
                style: TextStyle(color: Colors.blue, fontSize: 18),
                ),
            ),
            new Divider(height: 2.0,),
            ],
          );
        },
    );
  }
}