// ignore: file_names
// ignore: file_names
// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
// ignore: duplicate_import
import 'package:intl/intl.dart';

// ignore: camel_case_types
class new_transaction extends StatefulWidget {

   final Function addTx;

  const new_transaction(this.addTx, {Key? key}) : super(key: key);

  @override
  State<new_transaction> createState() => _new_transactionState();
}

// ignore: camel_case_types
class _new_transactionState extends State<new_transaction> {
  final _titleController =TextEditingController();

  final _amountController =TextEditingController();

//  DateTime _selectedDate;
DateTime _selectedDate = DateTime.now();

  void _addSubmit (){
    if(_amountController.text.isEmpty){
      return;
    }

    // ignore: non_constant_identifier_names
    final title_entered = _titleController.text;
    // ignore: non_constant_identifier_names
    final amount_entered =  double.parse(_amountController.text);

    // ignore: unnecessary_null_comparison
    if(title_entered.isEmpty || amount_entered <= 0 || _selectedDate == null){
      return;
    }

    widget.addTx
          (
            title_entered,
            amount_entered,
            _selectedDate,
                       );

    Navigator.of(context).pop();
  }

 
  void _presentDatePicker(){
    showDatePicker(context: context,
     initialDate: DateTime.now(),
      firstDate: DateTime(2000),
       lastDate: DateTime.now()
       ).then((pickedDate){
        if(pickedDate == null){
          return;
        }
      setState(() {
        _selectedDate = pickedDate;
      });
       });
       // ignore: avoid_print
       print("...");
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
                       style: Theme.of(context).textTheme.titleMedium,
                      decoration: const InputDecoration(labelText: "Title : " ),
                      controller: _titleController,
                       onSubmitted: (_) => _addSubmit(),
                    ),
                    const SizedBox(height: 5,),
                      TextField(
                       style: const TextStyle(fontSize: 18.0,  color: Colors.black, fontWeight: FontWeight.w500),
                      decoration: const InputDecoration(labelText: "Amount : "),
                      controller: _amountController,
                      keyboardType: TextInputType.number,
                      onSubmitted: (_) => _addSubmit(),

                    ),
                    const SizedBox(height :20),

                    // ignore: sized_box_for_whitespace
                    Container(height: 50,
                      child: Row(
                        children: [
                            Expanded(
                              child: Text(
                              // ignore: unnecessary_null_comparison
                              _selectedDate == null ?
                               "No choosen date" :
                               'Picked date : ${DateFormat.yMd().format(_selectedDate)}',
                                style: const TextStyle(fontWeight: FontWeight.w400,
                               fontSize: 15)),
                            ),
                    
                          
                          const SizedBox(width: 25,),
                    
                    
                          ElevatedButton(onPressed: _presentDatePicker, 
                          // ignore: unnecessary_null_comparison
                          child:  const Text(
                          'No choose Date' 
                           ,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                           ),
                           )
                          

                         
                    
                        ],
                      ),
                    ),
                    const SizedBox(height :15),
                   ElevatedButton(
                    onPressed: (){
                      _showToast(context);
                      // ignore: unused_label
                      child:  const Text('Succesffully Added');
                       _addSubmit();
                      
                    }, child: const Text("Add Transactions",
                   style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                   ),),
                  ],
                ),


               ),
                );
  }
  
  void _showToast(BuildContext context) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      const SnackBar(
        content: Text('Succesffully Added'),
        //action: SnackBarAction(label: 'UNDO', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }
  
  
}