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
              TextField(
              keyboardType: TextInputType.number,
              controller: textcontroller,
              maxLength: 5,
              decoration: InputDecoration(
                label: Text("₹"),
              ),
            ),
          TextField(
            keyboardType: TextInputType.datetime,
            controller: textcontroller,
            maxLength: 5,
            decoration: InputDecoration(
              label: Text("Date"),
            ),
          ),
          Center(
              child: Row(
                children: [
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