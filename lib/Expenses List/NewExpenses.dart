import 'package:expense_tracker/Expenses%20List/expensesListwidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/Model/expenses.dart';
import 'package:expense_tracker/Expenses List/expense.dart';

class NewExpense extends StatefulWidget{
  const NewExpense({super.key,required this.onaddexpense});

  final void Function(Expenses expense) onaddexpense;
  @override
  State<StatefulWidget> createState() {
    return _NewExpensestate();
  }
}
class _NewExpensestate extends State<NewExpense>{

  final textcontroller=TextEditingController();
  final amountcontroller=TextEditingController();
  DateTime? selectedDate;
  Category selectedcategory=Category.OTHERS;

  void checkvalid(){
    final checker=textcontroller.text.trim().isEmpty;
    final amountchecker=double.tryParse(amountcontroller.text);
    if(checker==null || amountchecker==null || amountchecker<=0 || selectedDate==null){
      showDialog(context: context, builder:(ctx)=>AlertDialog(
        title: Text("Invalid User Input"),
        content: Text("You have entered Invalid title,amount or date and Category,Please check before save changes"),
        actions: [
          TextButton(onPressed: (){
      Navigator.pop(ctx);
      },
            child: Text("Okay"),
      )

        ],
      ));
      return;
    }
    widget.onaddexpense(Expenses(title: textcontroller.text, amount: amountchecker, date: selectedDate!, Categories:selectedcategory));
    Navigator.pop(context);
  }

  void datepicker() async{
    final now=DateTime.now();
    final firstDate=DateTime(now.year-1,now.month,now.day);
    final lastDate=now;
    final datepickered= await showDatePicker(
        context: context,
        firstDate: firstDate,
        lastDate: lastDate
    );
    setState(() {
      selectedDate=datepickered!;
    });
  }

  @override
  void dispose() {
    textcontroller.dispose();
    amountcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            keyboardType: TextInputType.text,
            controller: textcontroller,
            maxLength: 50,
            decoration: InputDecoration(
              label: Text("Title"),
            ),
          ),
              Row(
                children:[
                  Expanded(child:TextField(
              keyboardType: TextInputType.number,
              controller: amountcontroller,
              maxLength: 5,
              decoration: InputDecoration(
                prefixText: "\₹",
                label: Text("Amount"),
              ),
            ),
                  ),
                  const SizedBox(width: 16,),
                  Expanded(
                    child:Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(selectedDate==null ?"Selected Date" :formatter.format(selectedDate!) ),
                      IconButton(onPressed: datepicker, icon: Icon(Icons.calendar_month_sharp)),
                    ],
                  ),
                  ),
      ]
              ),
          Container(
            child: Row(
                  children: [
                    DropdownButton(
                      value: selectedcategory,
                        items: Category.values.map(
                          (Category)=>DropdownMenuItem(
                          value: Category,
                          child: Text(Category.name)),
                    ).toList(),
                        onChanged: (value){
                          if(value==null){
                            return;
                          }
                          setState(() {
                            selectedcategory=value;
                          });
                        }
                    ),
                    ElevatedButton(onPressed: checkvalid, child: Text("Save Change")),
                    TextButton(onPressed: (){
                      Navigator.pop(context);
                    }, child: Text("Cancel")),
                  ],
            ),
          ),
        ],
      ),
    );
  }
}