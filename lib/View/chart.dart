import 'package:expensecounterapp/Models/transaction.dart';
import 'package:expensecounterapp/View/Chart_bar.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:intl/intl.dart';

// ignore: use_key_in_widget_constructors
class Chart extends StatelessWidget {
  
  // ignore: use_key_in_widget_constructors
  const Chart(this.recentTransaction);
  final List <Transaction> recentTransaction;

  List <Map<String,Object>> get groupedTransactionValues{
    return List.generate(7, (index){  
      final weekDay=DateTime.now().subtract(Duration(days: index),);

      var totalSum = 0.0;

      for(var i =0; i< recentTransaction.length; i++){

        if(recentTransaction[i].date.day == weekDay.day &&
        recentTransaction[i].date.month == weekDay.month &&
        recentTransaction[i].date.year == weekDay.year){

          totalSum += recentTransaction[i].amount;
        }
      }
    


      return {'day':DateFormat.E().format(weekDay).substring(0,1),
      'amount':totalSum};
    }).reversed.toList();
    
  }

   double get totalSpending{
    return groupedTransactionValues.fold(0.0,(sum,  item){
      return sum  + (item['amount'] as double);
    });
  }




  @override
  Widget build(BuildContext context) {
   
    return  Card(
      elevation: 6,
      margin: const EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: groupedTransactionValues.map((data){
              return Flexible(
                fit: FlexFit.tight,
                child: ChartBar(
                  data['day']as String,
                  data['amount']as double,
                (totalSpending == 0 ? 0 : (data["amount"] as double) / totalSpending ),
              ));
            }).toList(),
          ),
        ),
      ),
    );
  }
}