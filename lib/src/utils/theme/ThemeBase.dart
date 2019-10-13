import 'package:flutter/material.dart';

const String PATH_ICON_MENU = "lib/src/assets/icons/menu.png";
const String PATH_LOGO = "lib/src/assets/images/background.jpg";
const String PATH_CVV_BACKGROUND = "lib/src/assets/images/cvvbackground.jpg";

/// Background decoration
BoxDecoration backgroundDecoration = BoxDecoration(
  image: DecorationImage(
    image: AssetImage('lib/src/assets/images/background.jpg'),
    fit: BoxFit.cover,
  ),
);