import 'package:expense_tracker/Expenses%20List/expenseitem.dart';
import 'package:expense_tracker/Model/expenses.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget{
  const ExpensesList({
    super.key,required this.expensesList
});
  final List<Expenses> expensesList;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount:expensesList.length,
        itemBuilder: (context,index)=> ExpenseItem(expensesList[index]),
      ),
    );
  }
}