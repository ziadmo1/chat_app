import 'package:flutter/material.dart';

class MyTheme{

  static const Color lightBlue = Color(0xFF3598DB);

 static ThemeData lightTheme = ThemeData(
   primaryColor: lightBlue,
   textTheme: TextTheme(
     bodyMedium: TextStyle(
       fontSize: 16,
       fontWeight: FontWeight.w500,
       color: Colors.grey
     ),
     displayMedium: TextStyle(
       fontSize: 16,
       fontWeight: FontWeight.w500,
       color: Colors.white
   ),
     bodyLarge: TextStyle(
       fontSize: 20,
       color: lightBlue,
       fontWeight: FontWeight.bold
     ),
     titleMedium: TextStyle(
       fontSize: 18,
       color: Colors.black,
       fontWeight: FontWeight.bold
     )
   ),
   scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: AppBarTheme(
      elevation: 0,
      color: Colors.transparent,
      centerTitle: true,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold
      )
    )

  );
}