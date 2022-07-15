
import 'package:expensecounterapp/Models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
// ignore: camel_case_types
class list_transaction extends StatelessWidget {

final List<Transaction> transaction;

 // ignore: use_key_in_widget_constructors
 const list_transaction(this.transaction);
// ignore: unused_field



  @override
  Widget build(BuildContext context) {
    // ignore: sized_box_for_whitespace
    return  Container(
      height: 300,
      child: ListView.builder(
        itemCount: transaction.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
                  
                  child: Row(
                    children:  [
                    // ignore: avoid_unnecessary_containers
                    Container(
                     // padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      decoration:  BoxDecoration(
                        border: Border.all(
                          color: Theme.of(context).primaryColor,
                         width: 3,
          
                        ),
                      ),
                        padding:  const EdgeInsets.all(10),
          
                      child: Text(
                      '\$${transaction[index].amount.toStringAsFixed(2)}',
                        style:  TextStyle(
                          color: Theme.of(context).primaryColor
                          ,fontSize: 20,fontWeight: FontWeight.normal),
                      ),
                    ),
          
          
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                       // Text(tx.id, style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                        Text(transaction[index].title,style: const TextStyle(fontSize: 18,fontWeight: FontWeight.normal,color: Colors.black),),
                        const SizedBox(height: 3),
          
                        Text(
                          DateFormat().format(transaction[index].date),
                        style: const TextStyle(fontSize: 15,fontWeight: FontWeight.w400,color: Color.fromARGB(255, 75, 74, 74),)),
                      ],
                    ),
                    ],
          
                  ),
                );
        },
      ),
    
     
    );
  }
}