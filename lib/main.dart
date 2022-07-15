import 'package:flutter/material.dart';

import 'View/view.dart';

void main() {
  runApp( const Home());
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(

      theme: ThemeData(
        primarySwatch: Colors.amber,
         colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.amber),
        fontFamily: 'Quicksand'
        ),

      debugShowCheckedModeBanner: false,
      home: const View(),
    


    );
  }
}
