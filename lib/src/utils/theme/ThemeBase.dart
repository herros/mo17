import 'package:flutter/material.dart';

const String PATH_LOGO = "lib/src/assets/images/background.jpg";

/// Background decoration
BoxDecoration backgroundDecoration = BoxDecoration(
  image: DecorationImage(
    image: AssetImage('lib/src/assets/images/background.jpg'),
    fit: BoxFit.cover,
  ),
);