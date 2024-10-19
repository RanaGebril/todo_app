import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/firebase_functions.dart';
import 'package:todo_app/models/user_model.dart';

class MyProvider extends ChangeNotifier {
  ThemeMode AppTheme = ThemeMode.light;

  //To store user data and not to login each time the app opened
  UserModel? userModel;

  // data for the user who log in stored at user class in firebase
  User? fireStoreUser;

  // Constructor to load theme when provider is created
  MyProvider() {
    getTheme();

    //check if the user already log in and return user object
    fireStoreUser = FirebaseAuth.instance.currentUser;
    if (fireStoreUser != null) {
      userData();
      notifyListeners();
    }
  }

  Future<void>userData() async {
    userModel = await FirebaseFunctions.getUserData();
    notifyListeners();
  }

  // Asynchronously loads the theme preference from SharedPreferences
  Future<void> getTheme() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool? darkMode = prefs.getBool('isDark');
    if (darkMode != null) {
      AppTheme = darkMode ? ThemeMode.dark : ThemeMode.light;
      notifyListeners(); // Notify listeners after setting the theme
    }
  }

  // This method changes the theme and stores the new preference in SharedPreferences
  Future<void> changeTheme(ThemeMode themeMode) async {
    AppTheme = themeMode;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDark', AppTheme == ThemeMode.dark);
    notifyListeners();
  }
}
