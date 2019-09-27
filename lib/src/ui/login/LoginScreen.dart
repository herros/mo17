import 'package:flutter/material.dart';
import 'package:apptemplates/src/utils/string/LoginStrings.dart';
import 'package:apptemplates/src/utils/theme/index.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return LoginScreenStateful();
  }
}

class LoginScreenStateful extends StatefulWidget {
  LoginScreenStateful({Key key}) : super(key: key);

  @override
  LoginScreenState createState() => new LoginScreenState();
}

class LoginScreenState extends State<LoginScreenStateful> {
  double width;
  double height;

  // Text controllers
  TextEditingController usnController = new TextEditingController();
  TextEditingController pwdController = new TextEditingController();

  List<Widget> widgets = List();

  @override
  void initState() {
    super.initState();
  }

  void getScreenSize(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
  }

  @override
  Widget build(BuildContext context) {
    this.getScreenSize(context);
    return Scaffold(
      appBar: null,
      body: SingleChildScrollView(
        child: GestureDetector(
          onTap: () {
            // Disable keyboard when touch outside form edit text
            FocusScope.of(context).autofocus(FocusNode());
          },
          child: bodyWidget(context),
        ),
      ),
    );
  }

  Widget bodyWidget(BuildContext context) {
    widgets.clear();
    // add widget to list widget
    widgets.add(logo(context));
    widgets.add(formLogin(context));
    return Container(
      height: height,
      width: width,
      decoration: new BoxDecoration(image: backgroundLogin(context)),
      child: ListView.builder(
        itemCount: widgets.length,
        itemBuilder: (context, index) {
          return widgets[index];
        },
      ),
    );
  }

  // Background image body
  DecorationImage backgroundLogin(BuildContext context) {
    return new DecorationImage(
        image: AssetImage(PATH_IMG_BR), fit: BoxFit.fill);
  }

  // Logo
  Widget logo(BuildContext context) {
    return Container(
      height: height * 0.2,
      width: height * 0.2,
      margin: EdgeInsets.all(10.0),
      decoration: new BoxDecoration(
          image: DecorationImage(
              image: AssetImage(PATH_IMG_LOGO), fit: BoxFit.cover)),
    );
  }

  // Form login
  Widget formLogin(BuildContext context) {
    return Container(
      height: height * factor_height_form_login,
      width: width * factor_width_form_login,
      decoration: new BoxDecoration(
        color: color_br_formLogin,
      ),
      child: Column(
        children: <Widget>[
          // Edit text username
          edtField(usnController, TextInputType.text, false, LBL_EDT_USN, ""),
          edtField(pwdController, TextInputType.text, true, LBL_EDT_PWD, ""),
          btnLogin(LBL_BTN_LOGIN),
          btnRegister(LBL_BTN_REGISTER)
        ],
      ),
    );
  }

  Widget edtField(TextEditingController controller, TextInputType type,
      bool scureText, String label, String hint) {
    return Container(
        height: height * factor_height_edt,
        width: width * factor_width_edt,
        decoration: new BoxDecoration(color: color_br_edt),
        child: TextField(
          controller: controller,
          keyboardType: type,
          obscureText: scureText,
          style: TextStyle(
            fontSize: font_size_edt,
             height: factor_height_edt,
          ),
          decoration: new InputDecoration(
              contentPadding: EdgeInsets.all(distance_padding_left_edt),
              labelText: label,
              labelStyle: TextStyle(color: color_lbl)),
        ));
  }

  // Button login
  RaisedButton btnLogin(String lbl) {
    return RaisedButton(
      child: Text(lbl),
      onPressed: () {},
    );
  }

  // Button register
  RaisedButton btnRegister(String lbl) {
    return RaisedButton(child: Text(lbl), onPressed: () {});
  }

  // Others
}
