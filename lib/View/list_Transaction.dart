


import 'package:expensecounterapp/Models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
// ignore: camel_case_types
class list_transaction extends StatelessWidget {

final List<Transaction> transaction;
final Function deletetx;

 // ignore: use_key_in_widget_constructors
 const list_transaction(this.transaction,this.deletetx,);
// ignore: unused_field



  @override
  Widget build(BuildContext context) {
    // ignore: sized_box_for_whitespace
    return  Container(
      height: 500,
      child: transaction.isEmpty ? Column(
        children:  [
          const SizedBox(
            height: 10,
          ),

          Text("You have yet no transactions !", style: Theme.of(context).textTheme.titleMedium),

          const SizedBox(
            height: 20,
          ),

          // ignore: sized_box_for_whitespace
          Container(
            height: 200,
            child: Image.asset('assets/images/empty.png',fit: BoxFit.cover,)),

        ],
       
      ): ListView.builder(
        itemCount: transaction.length,
        itemBuilder: (BuildContext context, int index) {
          return  Card(
            elevation: 3,
            margin: const EdgeInsets.symmetric(
              horizontal: 5,
              vertical: 8
            ),
            child: ListTile(
              leading: CircleAvatar(radius: 30,
              child: Padding(
                padding: const EdgeInsets.all(7),
                child: FittedBox(
                  child: Text(style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                  'Rs ${transaction[index].amount.toStringAsFixed(0)}'),
                ),
              ),
              ),
              title: Text(transaction[index].title,
               style: Theme.of(context).textTheme.titleMedium,),
               subtitle: Text(DateFormat.yMMMEd().format(transaction[index].date)),
               trailing: IconButton(onPressed: ()=> deletetx(transaction[index].id),
                icon: const Icon(Icons.delete),
                color: Colors.red,
                ), 
                ),
          
          );
        },
      ),
    
     
    );
  }
}