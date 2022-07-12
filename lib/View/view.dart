// ignore: unused_import
// ignore_for_file: deprecated_member_use

// ignore: unused_import
import 'dart:async';
// ignore: unused_import
import 'dart:convert';

// ignore: unused_import
import 'package:flutter/gestures.dart';

import './list_Transaction.dart';
import 'package:flutter/material.dart';

import 'list_Transaction.dart';
import 'new_Transaction.dart';
import '../Models/transaction.dart';
// ignore: unused_import


class View extends StatefulWidget {
   const View({Key? key}) : super(key: key);

  @override
  State<View> createState() => _ViewState();
}

class _ViewState extends State<View> {

  final List<Transaction> _userTransaction = [

   Transaction(
        id: 'A1', 
        title: "Bhorjaan",
        amount: 30.0,
        date: DateTime.now(),
         
         ),

         Transaction(
        id: 'A2',
        title: "Hustle",
        amount: 20.0,
        date: DateTime.now(),
         
         ),


         Transaction(
        id: 'A3',
        title: "Hush puppies",
        amount: 10.0,
        date: DateTime.now(),
         
         ),
];

// ignore: unused_element
void _addNewTransaction(String txtitle, double txamount){

    // ignore: unused_local_variable
    final newTx = Transaction(
      title: txtitle,
      amount: txamount,
      date: DateTime.now(),
       id: DateTime.now().toString(),

    );
    setState(() {
      _userTransaction.add(newTx); 
    });


}
  
  void _startAddNewTransaction(BuildContext ctx){
    showModalBottomSheet(context: ctx, builder: (_)
    {
      return  new_transaction(_addNewTransaction);
     

    } );
  }

  @override
  Widget build(BuildContext ctx) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: Scaffold(
        appBar: AppBar(
          title: const Text("Expense App"),

          //actions: [
         //   IconButton(onPressed: ()=> startAddNewTransaction(context), 
           // icon: const Icon(Icons.add,),)
         // ],
  ),

     body: SingleChildScrollView(
       child: Column(
        children: [
          // ignore: sized_box_for_whitespace
          Container(
            width: double.infinity,
            height: 100,
            child: const Card(
              elevation: 5,
              child: Text("Chart Box"),
            ),
          ),
      list_transaction(_userTransaction),
            
        ],
     
     
       ),
       
     ), 
    //  //floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton
     (
     child:  const Icon(Icons.add),
      onPressed: ()=>
        ()=> _startAddNewTransaction(ctx), 
      ),

      ),


    );
  }
}
