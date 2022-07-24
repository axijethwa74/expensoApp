// ignore: unused_import
// ignore_for_file: deprecated_member_use
// ignore: unused_import
//import 'package:expensecounterapp/View/chart.dart';
// ignore: unused_import
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

// ignore: unused_element
List<Transaction> get _recentTransaction{
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



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:  Center(child: Text("Personal Expense App",
          style: Theme.of(context).textTheme.titleMedium,
          ),
          ),
           actions: [
           IconButton(
            onPressed: () => _startAddNewTransaction(context), 
           icon: const Icon(Icons.add,),)
          ],
  ),

     body: SingleChildScrollView(

       child: Column( 
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children:<Widget> [
          // ignore: sized_box_for_whitespace
         Chart(_recentTransaction),
      list_transaction(_userTransaction,_deleteTransaction),
            
        ],
       ),
     ), 
    floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
     child:  const Icon(Icons.add),
      onPressed:()=> _startAddNewTransaction(context), 
      ),
    );
  }
}
