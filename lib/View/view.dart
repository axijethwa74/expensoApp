// ignore: unused_import
// ignore_for_file: deprecated_member_use, sized_box_for_whitespace, unused_local_variable
// ignore: unused_import
//import 'package:expensecounterapp/View/chart.dart';
// ignore: unused_import
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'chart.dart';
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

    //Defaults Transactions :
  //  Transaction(
  //       id: 'A1', 
  //       title: "Bhorjaan",
  //       amount: 30.0,
  //       date: DateTime.now(),
         
  //        ),

  //        Transaction(
  //       id: 'A2',
  //       title: "Hustle",
  //       amount: 20.0,
  //       date: DateTime.now(),
         
  //        ),


  //        Transaction(
  //       id: 'A3',
  //       title: "Hush puppies",
  //       amount: 10.0,
  //       date: DateTime.now(),
         
  //        ),
];
// ignore: prefer_final_fields, unused_field
bool _showChart = false;
// ignore: unused_element
List<Transaction> get  _recentTransaction{
  return _userTransaction.where((tx) {
    return tx.date.isAfter(
      DateTime.now().subtract(const Duration(
        days: 7),),
    );
  }).toList();
}

// ignore: unused_element
void _addNewTransaction(String txtitle, double txamount, DateTime chosedate){

    // ignore: unused_local_variable
    final newTx = Transaction(
      title: txtitle,
      amount: txamount,
      date: chosedate,
       id: DateTime.now().toString(),

    );
    setState(() {
      _userTransaction.add(newTx); 
    });


}
  
  void _startAddNewTransaction(BuildContext context){
    showModalBottomSheet(context: context, builder: (_)
    {
      return GestureDetector(
        onTap: (){},
        // ignore: sort_child_properties_last
        child: new_transaction(_addNewTransaction),
        behavior: HitTestBehavior.opaque,
      );
    },
     );
  }

  // ignore: unused_element
  void _deleteTransaction(String id){
    setState(() {
      _userTransaction.removeWhere((tx) {
        return tx.id == id;
      }
       );
    });
  }


  // ignore: prefer_final_fields, unused_field
  bool _theme = false;
  bool _iconBool = false;
  // ignore: no_leading_underscores_for_local_identifiers
// ignore: prefer_final_fields, unused_field, no_leading_underscores_for_local_identifiers
IconData _iconlight = Icons.wb_sunny;
// ignore: prefer_final_fields, unused_field, no_leading_underscores_for_local_identifiers
IconData _icondark = Icons.nights_stay;

// ignore: no_leading_underscores_for_local_identifiers, unused_field
final ThemeData _lightTheme = ThemeData(
   primarySwatch: Colors.amber,
         colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.amber),
         textTheme: ThemeData.light().textTheme.copyWith(
          titleMedium:const TextStyle(
            fontFamily: 'Quicksand',
            fontSize: 22,     
              ),
              ),
     brightness: Brightness.light,
);

// ignore: no_leading_underscores_for_local_identifiers, unused_field
final ThemeData _darkTheme = ThemeData(

    scaffoldBackgroundColor: Colors.black,
    colorScheme: const ColorScheme.dark(),
      // ignore: prefer_const_constructors
      appBarTheme: AppBarTheme(
       backgroundColor: Colors.white, 
      ),
      textTheme: ThemeData.light().textTheme.copyWith(
          titleMedium:const TextStyle(
            fontFamily: 'Quicksand',
            fontSize: 22,   
              ),
              ),    
                
  brightness: Brightness.dark,
);


  

  @override
  // ignore: duplicate_ignore
  Widget build(BuildContext context) {
   
    
    final mediaQuery = MediaQuery.of(context);
    final isLandscape = mediaQuery.orientation == Orientation.landscape;

    //Appbar Shortand 
    final PreferredSizeWidget appbar;
    if (Platform.isIOS) {
      appbar =  CupertinoNavigationBar(
        middle : Center(
          child: Text("Expenso App"
          , style: Theme.of(context).textTheme.titleMedium,),
        ),
        trailing: Row(
           mainAxisSize : MainAxisSize.max,
          children: [
            GestureDetector(
              onTap: () => _startAddNewTransaction(context),
              child: const Icon(CupertinoIcons.add),
            ),
          ],
        ),
        
        );
    } 
    
    else {
      appbar = AppBar(
          title:  Center(child: Text("Expenso App",
          style: Theme.of(context).textTheme.titleMedium,
          
          ),
          ),
           actions: [
          IconButton(
            onPressed: () {
              setState(() {
                _iconBool =! _iconBool;
              });
            }, 
           icon:  Icon(_iconBool ? _iconlight : _icondark),
           ),
          ],       
  );
    }






  final txlistWidget = Container(
        height: (mediaQuery.size.height-appbar.preferredSize.height) * 0.6,
        child: list_transaction(_userTransaction,_deleteTransaction));

  final reTxWidget =  Container(
        height: (mediaQuery.size.height-appbar.preferredSize.height
        - MediaQuery.of(context).padding.top) * 0.7,
         child : Chart(_recentTransaction),
         );

  //Variable for IOS

 
  final dynamicpage = SafeArea(child: SingleChildScrollView(
       child: Column( 
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children:<Widget> [
         if(isLandscape) Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Switch(value: _showChart, onChanged: (val){
                setState(() {
                  _showChart=val;
                },);
              },),
            ],
          ),
          if(!isLandscape)Container(
        height: (mediaQuery.size.height-appbar.preferredSize.height
        - MediaQuery.of(context).padding.top) * 0.3,
         child : Chart(_recentTransaction),
         ),
          if(!isLandscape)txlistWidget,
         if(isLandscape) _showChart ? reTxWidget : txlistWidget,     
        ],
       ),
  ),
     );

    return MaterialApp(
       debugShowCheckedModeBanner: false,
      theme: _iconBool ? _darkTheme : _lightTheme,
     home: Platform.isIOS ? CupertinoPageScaffold(child: dynamicpage,) :  Scaffold(
     appBar: appbar,
     body: dynamicpage,
   
    floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
     child:  const Icon(Icons.add),
      onPressed:()=> _startAddNewTransaction(context), 
      ),
     ),
    );
  }
}
