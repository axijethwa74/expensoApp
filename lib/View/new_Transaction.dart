// ignore: file_names
// ignore: file_names
import 'package:flutter/material.dart';

// ignore: camel_case_types
class new_transaction extends StatelessWidget {

   final Function addTx;
  final titleController =TextEditingController();
  final amountController =TextEditingController();
  new_transaction(this.addTx, {Key? key}) : super(key: key);

  void addSubmit (){

    // ignore: non_constant_identifier_names
    final title_entered = titleController.text;
    // ignore: non_constant_identifier_names
    final amount_entered =  double.parse(amountController.text);

    if(title_entered.isEmpty || amount_entered <= 0){
      return;
    }

    addTx
          (
            title_entered,
            amount_entered,
                       );
  }


  @override
  Widget build(BuildContext context) {
    return  Card(
               child: Container(
                padding: const EdgeInsets.all(20),
                 child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children:  [
                    
                     TextField(
                       style: const TextStyle(fontSize: 18.0,  color: Colors.black, fontWeight: FontWeight.w500),
                      decoration: const InputDecoration(labelText: "Title : " ),
                      controller: titleController,
                       onSubmitted: (_) => addSubmit(),
                    ),
                    const SizedBox(height: 5,),
                      TextField(
                       style: const TextStyle(fontSize: 18.0,  color: Colors.black, fontWeight: FontWeight.w500),
                      decoration: const InputDecoration(labelText: "Amount : "),
                      controller: amountController,
                      keyboardType: TextInputType.number,
                      onSubmitted: (_) => addSubmit(),

                    ),
                    const SizedBox(height :15),
                   ElevatedButton(
                    onPressed: (){
                       addSubmit();
                      
                    }, child: const Text("Add Transactions",
                   style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                   ),),
                  ],
                ),


               ),
                );
  }
}