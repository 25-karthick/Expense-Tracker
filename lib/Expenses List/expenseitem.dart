
import 'package:expense_tracker/Model/expenses.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExpenseItem extends StatelessWidget{
  const ExpenseItem(this.expenses,{super.key});
  final Expenses expenses;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(expenses.title),
            const SizedBox(height: 5,),
            Row(
              children: [
                Icon(Icons.alarm),
                const Spacer(),
                Text('${expenses.date.toString()}'),
              ],
            )
          ],
        ),
      ),
    );
  }
}