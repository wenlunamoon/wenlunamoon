import 'package:flutter/material.dart';

abstract class Design {
  static Color get mainColor => _mainColor;
  static Color get mainColorDark => _mainColorDark;
  static Color get mainColorLight => _mainColorLight;
  static Color get erroColor => _errorColor;
}

const _mainColor = Color(0xff47b571);
const _mainColorLight = Color(0xff61c989);
const _mainColorDark = Color(0xff349158);

const _errorColor = Color(0xFFff4444);
