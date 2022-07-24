// ignore_for_file: deprecated_member_use

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
         textTheme: ThemeData.light().textTheme.copyWith(
          titleMedium:const TextStyle(
            fontFamily: 'Quicksand',
            fontSize: 22,
            //fontWeight: FontWeight.bold,


          ),

         ),
         
        // fontFamily: 'OpenSans'
      // appBarTheme:  const AppBarTheme(   
      //         // backgroundColor: Colors.deepPurple,
      //         // This will be applied to the "back" icon
      //         iconTheme: IconThemeData(color: Colors.red),
      //         // This will be applied to the action icon buttons that locates on the right side
      //         actionsIconTheme: IconThemeData(color: Colors.amber),
      //        // centerTitle: false,
      //        // elevation: 15,
            
      //         titleTextStyle: TextStyle(color: Colors.black))
       ),

        
      

      debugShowCheckedModeBanner: false,
      home: const View(),
    


    );
  }
}
