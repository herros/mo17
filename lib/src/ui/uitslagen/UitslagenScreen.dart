import 'package:mo17/config.dart';
import 'package:mo17/src/models/Uitslag.dart';
import 'package:flutter/material.dart';
import 'package:mo17/src/base/ui/BaseStatelessWidget.dart';

class UitslagenScreen extends BaseStatelessWidget {

  final String urlUitslagen;
  final String headerText;

  UitslagenScreen(this.urlUitslagen, this.headerText);

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
        title: AppConfig.of(context).appBarTitle(headerText)
      ),
      body: Container(
        child: 
          new FutureBuilder<String> (
          future: AppConfig.of(context).getData(urlUitslagen),
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

  Widget createListView(BuildContext context, AsyncSnapshot uitslagen) {
    List<Uitslag> lijst = uitslagFromJson(uitslagen.data);

    return new ListView.builder(
      itemCount: lijst.length,
      itemBuilder: (BuildContext context, int index) {
        return 
        new Column(
          children: <Widget>[
            new ListTile(
              subtitle: new Text(lijst[index].datum), //, textScaleFactor: 0.8,),
              title:
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  createField(lijst[index].home, 2),
                  createField(lijst[index].away, 2),
                  createField(lijst[index].uitslag, 1)
                ]
              )
            ),
              new Divider(height: 2.0,)
            ]
          );
      }
    );
  }

  Widget createField(field, factor) {
    return new Expanded(
        flex: factor,
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Text(field, style: TextStyle(color: Colors.blue, fontSize: 16))
          ],
        ),
      );
  }
}