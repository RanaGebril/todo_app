import 'package:flutter/material.dart';


class MyProvider extends ChangeNotifier{
  ThemeMode AppTheme = ThemeMode.light;

changeTheme(ThemeMode themeMode){
  AppTheme =themeMode;
  notifyListeners();
}
}