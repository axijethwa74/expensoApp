// ignore_for_file: deprecated_member_use

// ignore: unused_import
import 'package:expensecounterapp/Models/transaction.dart';
import 'package:flutter/material.dart';

import 'View/view.dart';

void main() {
  runApp( const Home());
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
//  final lighttheme =ThemeData(
//         primarySwatch: Colors.amber,
//          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.amber),
//          textTheme: ThemeData.light().textTheme.copyWith(
//           titleMedium:const TextStyle(
//             fontFamily: 'Quicksand',
//             fontSize: 20,
//            fontWeight: FontWeight.bold,
//  ),
//  ),
//  );

//  final darktheme = ThemeData(
//         primarySwatch: Colors.grey,
//          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.grey),
//          textTheme: ThemeData.dark().textTheme.copyWith(
//           titleMedium:const TextStyle(
//             fontFamily: 'Quicksand',
//             fontSize: 20,
//            fontWeight: FontWeight.bold,
//  ),
//  ),
//  );






  @override
  Widget build(BuildContext context) {

    return  MaterialApp(
      theme: ThemeData(
   primarySwatch: Colors.amber,
         colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.amber),
         textTheme: ThemeData.light().textTheme.copyWith(
          titleMedium:const TextStyle(
            fontFamily: 'Quicksand',
            fontSize: 22,     
              ),
              ),
     brightness: Brightness.light,
),
       debugShowCheckedModeBanner: false,
      home: const View(),
    );
  }
}
