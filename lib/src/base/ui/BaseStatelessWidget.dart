import "package:flutter/material.dart";

abstract class BaseStatelessWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
    return null;
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
    return null;
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
}
