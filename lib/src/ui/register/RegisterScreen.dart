import 'package:flutter/material.dart';
import 'package:apptemplates/src/base/ui/BaseStatelessWidget.dart';
import 'package:apptemplates/src/utils/string/RegisterStrings.dart';
import 'package:apptemplates/src/utils/theme/index.dart';

class RegisterScreen extends BaseStatelessWidget {
  Size size;

  /// Text controllers
  /// username, password, retype password
  TextEditingController usnController = new TextEditingController();
  TextEditingController pwdController = new TextEditingController();
  TextEditingController repwdController = new TextEditingController();

  @override
  Widget onInitBody(BuildContext context) {
    return Container(
      decoration: backgroundDecoration,
      child: Column(
        children: <Widget>[_formRegister(), _formButtons(context)],
      ),
    );
  }

  /// include edit text for user name, password, retype password , button register , button cancel
  Widget _formRegister() {
    return Column(children: <Widget>[
      /// User name
      editText(HINT_USN, "", usnController),
      // Password
      editText(HINT_PWD, "", pwdController),
      // Retype password
      editText(HINT_REPWD, "", repwdController),
    ]);
  }

  /// Widget edit text
  /// [@required] hint
  /// [@required] label
  /// [@required] controller
  Widget editText(String hint, String lbl, TextEditingController controller) {
    return Container(
      child: new TextField(
        controller: controller,
        decoration: new InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(
              // Style for hint in here
              ),
        ),
      ),
    );
  }

  /// Form button
  /// [@requried] Register button
  /// [@required] Cancel button
  Widget _formButtons(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          RaisedButton(
            onPressed: () {
              _onPressRegister(context);
            },
            child: Text("Register"),
          ),
          RaisedButton(
            onPressed: () {
              _onPressCancel(context);
            },
            child: Text("Cancel"),
          )
        ],
      ),
    );
  }

  /// Button login
  Widget _btnRegister(BuildContext context) {
    return RaisedButton(
      onPressed: _onPressRegister(context),
      // child: new Text(REGISTER),
    );
  }

  /// Button cancel
  Widget _btnCancel(BuildContext context) {
    return RaisedButton(
      onPressed: _onPressCancel(context),
      // child: new Text(CANCEL),
    );
  }

  /// Register
  _onPressRegister(BuildContext context) {
    // Get text form text field
    String _usn = usnController.text;
    String _pwd = pwdController.text;
    String _retype = repwdController.text;

    /// Check not empty data
    if (_usn.isEmpty || _pwd.isEmpty || _retype.isEmpty) {
      print("Please check infomations");
    }

    /// Compare password with retype password
    if (_pwd.compareTo(_retype) != 0) {
      // Not Equivalent
      print("Password not Equivalent");
    }
  }

  /// Cancel
  _onPressCancel(BuildContext context) {
    // // come back to previous screen
    // popScreen(context);
  }
}
