// ignore: file_names
import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  
  final String label;
  final double spendingamount;
  final double  spendingPcOfTotal;

  // ignore: use_key_in_widget_constructors
  const ChartBar(this.label,this.spendingamount,this.spendingPcOfTotal);


  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Column(
      children: [
      // ignore: sized_box_for_whitespace
      Container(
        width: 34, 
        height:constraints.maxHeight * 0.15,
        child: FittedBox(
          child: Text(
            'Rs ${spendingamount.toStringAsFixed(0)}',
            style:const TextStyle(
              fontWeight: FontWeight.bold,
             fontSize: 10,
            
            )),
        ),
      ),

         SizedBox(
          height:constraints.maxHeight * 0.05,
        ),

        // ignore: sized_box_for_whitespace
        Container(
          height:constraints.maxHeight * 0.6,
          width: 10,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey,width: 0.1),
                  color: const Color.fromRGBO(220, 220, 220, 1),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              FractionallySizedBox(heightFactor: spendingPcOfTotal,
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),)
            ],

          ),

        ),

          SizedBox(
          height:constraints.maxHeight * 0.05,
        ),

        // ignore: sized_box_for_whitespace
        Container(height:constraints.maxHeight * 0.05,
          child: FittedBox(child: Text(label))),

      ],
    );
      
    },
    );
    
  }
}