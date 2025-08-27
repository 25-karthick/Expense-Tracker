import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _NewExpensestate();
  }
}
class _NewExpensestate extends State<NewExpense>{

  final textcontroller=TextEditingController();
  final amountcontroller=TextEditingController();

  void datepicker(){
    final now=DateTime.now();
    final firstDate=DateTime(now.year-1,now.month,now.day);
    final lastDate=now;
    showDatePicker(context: context, firstDate: firstDate, lastDate: lastDate);
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
                  Expanded(child:Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("Selected Date"),
                      IconButton(onPressed: datepicker, icon: Icon(Icons.calendar_month_sharp)),
                    ],
                  ),
                  ),
      ]
              ),
          Row(
                children: [
                  ElevatedButton(onPressed: (){}, child: Text("Save Change")),
                  ElevatedButton(onPressed: (){}, child: Text("Cancel")),
                ],
          ),
        ],
      ),
    );
  }
}