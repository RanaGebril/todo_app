import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/App_theme_data.dart';
import 'package:todo_app/firebase_options.dart';
import 'package:todo_app/home_screen.dart';
import 'package:todo_app/providers/My_provider.dart';
import 'package:todo_app/register/creat_account.dart';
import 'package:todo_app/register/log_in.dart';
import 'package:todo_app/splash_screen.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/tabs/tasks/edit_tab.dart';

void main() async {
  // to initialize before run app
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  //localization
  await EasyLocalization.ensureInitialized();

  //local storage no server
  await FirebaseFirestore.instance.enableNetwork();

  runApp(ChangeNotifierProvider(
      create: (context) => MyProvider(),
      child: EasyLocalization(
          supportedLocales: [Locale('en'), Locale('ar')],
          path: 'assets/translations',
          child: MyApp())));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var provider_object = Provider.of<MyProvider>(context);
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      theme: AppThemeData.light_mode,
      darkTheme: AppThemeData.dark_mode,
      themeMode: provider_object.AppTheme,
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (context) => SplashScreen(),
        HomeScreen.routeName: (context) => HomeScreen(),
        EditTab.routeName: (context) => EditTab(),
        CreateAccount.routeName: (context) => CreateAccount(),
        LogIn.routeName: (context) => LogIn()
      },
    );
  }
}
