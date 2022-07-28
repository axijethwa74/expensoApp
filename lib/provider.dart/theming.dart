// ignore: unused_import
import 'package:flutter/material.dart';

class MyTheme{
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.black,
    colorScheme: const ColorScheme.dark(),
      // ignore: prefer_const_constructors
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.black,
      ),
      textTheme: ThemeData.light().textTheme.copyWith(
          titleMedium:const TextStyle(
            fontFamily: 'Quicksand',
            fontSize: 22,     
              ),
              ),           
  );

  static final lightTheme = ThemeData.light().textTheme.copyWith(
          titleMedium:const TextStyle(
            fontFamily: 'Quicksand',
            fontSize: 22,     
              ),
              );          
  
}