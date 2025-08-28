import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/Model/expenses.dart';

class NewExpense extends StatefulWidget{
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
                    ElevatedButton(onPressed: (){}, child: Text("Save Change")),
                    ElevatedButton(onPressed: (){}, child: Text("Cancel")),
                  ],
            ),
          ),
        ],
      ),
    );
  }
}