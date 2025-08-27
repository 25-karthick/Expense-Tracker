
import 'package:expense_tracker/Model/expenses.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExpenseItem extends StatelessWidget{
  const ExpenseItem(this.expenses,{super.key});
  final Expenses expenses;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 100,
        width: 100,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 5.0,
            horizontal: 5.0,
          ),

          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Text(expenses.title,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                const Spacer(),
                Row(
                      children: [
                        Text("\$${expenses.amount.toString()}"),
                        const Spacer(),
                        Icon(CategoryIcon[expenses.Categories]),
                        const SizedBox(width: 5,),
                        Text(expenses.FormatDate),
                      ],
                    ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}