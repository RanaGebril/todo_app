import 'dart:async';
import 'package:flutter/material.dart';
import 'AppColors.dart';
import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = "splash";

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, HomeScreen.routeName);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Appcolors.primary_light,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset("assets/images/logo.png",
              height: MediaQuery.of(context).size.height * 0.715),
          Image.asset(
            "assets/images/routeBlue.png",
          )
        ],
      ),
    );
  }
}
