import 'package:flutter/material.dart';
import 'package:todo_app/App_theme_data.dart';
import 'package:todo_app/home_screen.dart';
import 'package:todo_app/providers/My_provider.dart';
import 'package:todo_app/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp( ChangeNotifierProvider(
      create:(context) => MyProvider(),
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override

  Widget build(BuildContext context) {
    var provider_object=Provider.of<MyProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppThemeData.light_mode,
      darkTheme:AppThemeData.dark_mode ,
      themeMode: provider_object.AppTheme,
      initialRoute: SplashScreen.routeName ,
      routes: {
        SplashScreen.routeName:(context)=> SplashScreen(),
        HomeScreen.routeName:(context)=> HomeScreen()
      },
    );
  }
}
