import 'package:flutter/material.dart';
import 'package:todo_app/AppColors.dart';

class AppThemeData{
  static  ThemeData light_mode=ThemeData(
    scaffoldBackgroundColor: Appcolors.primary_light,
    appBarTheme: AppBarTheme(
      color: Appcolors.blueColor,
      titleTextStyle: TextStyle(
        fontFamily: "Poppins",
        fontWeight: FontWeight.w700,
        fontSize: 22,
         color: Appcolors.whiteColor,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.transparent,
      elevation: 0,
      showUnselectedLabels: false,
      showSelectedLabels: false,
      selectedIconTheme: IconThemeData(
        color: Appcolors.blueColor,
        size: 35,
      ),
      unselectedIconTheme: IconThemeData(
        color: Appcolors.grayColor1,
        size: 35
      )

    ),
      bottomAppBarTheme: BottomAppBarTheme(
        padding: EdgeInsets.all(0),
        shape: CircularNotchedRectangle(),
        color: Appcolors.whiteColor,
      ),
     textTheme: TextTheme(
       bodyLarge: TextStyle(
         fontSize: 22,
         fontWeight: FontWeight.w700,
         color: Appcolors.greenColor
       ),
       bodyMedium: TextStyle(
           fontSize: 20,
           fontWeight: FontWeight.w400,
           color: Appcolors.blackFontColor
       ),
       bodySmall: TextStyle(
           fontSize: 18,
           fontWeight: FontWeight.w700,
           color: Appcolors.blackFontColor
       ),
       displayLarge: TextStyle(
           fontSize: 18,
           fontWeight: FontWeight.w400,
           color: Appcolors.whiteColor
       ),
       displayMedium: TextStyle(
           fontSize: 15,
           fontWeight: FontWeight.w700,
           color: Appcolors.blackFontColor
       ),
       // displaySmall: TextStyle(
       //     fontSize: 14,
       //     fontWeight: FontWeight.w700,
       //     color: Appcolors.blackFontColor
       // ),
       labelLarge: TextStyle(
           fontSize: 14,
         fontWeight: FontWeight.w400,
         color: Appcolors.blueColor
       ),
       labelMedium: TextStyle(
         fontSize: 12,
         fontWeight: FontWeight.w400,
         color: Appcolors.blackFontColor
       )

     ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Appcolors.blueColor,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
          side: BorderSide(color: Appcolors.whiteColor, width: 3)),
    ),
  );
  static ThemeData dark_mode=ThemeData(
      scaffoldBackgroundColor: Appcolors.primary_dark,
      appBarTheme: AppBarTheme(
        color: Appcolors.blueColor,
        titleTextStyle: TextStyle(
          fontFamily: "Poppins",
          fontWeight: FontWeight.w700,
          fontSize: 22,
          color: Appcolors.primary_dark,
        ),
      ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.transparent,
        elevation: 0,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        selectedIconTheme: IconThemeData(
          color: Appcolors.blueColor,
          size: 35,
        ),
        unselectedIconTheme: IconThemeData(
            color: Appcolors.grayColor1,
            size: 35
        )

    ),
      bottomAppBarTheme: BottomAppBarTheme(
        padding: EdgeInsets.all(0),
        shape: CircularNotchedRectangle(),
        color: Appcolors.secondary_dark,
      ),
    textTheme: TextTheme(
        bodyLarge: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            color: Appcolors.greenColor
        ),
        bodyMedium: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w400,
            color: Appcolors.whiteColor
        ),
        bodySmall: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Appcolors.blackFontColor
        ),
        displayLarge: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w400,
            color: Appcolors.whiteColor
        ),
        displayMedium: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w700,
            color: Appcolors.blackFontColor
        ),
        displaySmall: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: Appcolors.whiteColor
        ),
        labelLarge: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Appcolors.blueColor
        ),
        labelMedium: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: Appcolors.whiteColor
        )

    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Appcolors.blueColor,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
          side: BorderSide(color: Appcolors.secondary_dark, width: 3)),
    ),

  );
}