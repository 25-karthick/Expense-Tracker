import 'package:expense_tracker/Expenses%20List/expenseitem.dart';
import 'package:expense_tracker/Model/expenses.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget{
  ExpensesList({
    super.key,
    required this.expensesList,
    required this.onremoveexpense,
});
  void Function(Expenses expense) onremoveexpense;
  final List<Expenses> expensesList;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount:expensesList.length,
        itemBuilder: (context,index)=> Dismissible(
            key: ValueKey(expensesList[index]),
            onDismissed:(direction){
              onremoveexpense(expensesList[index]);
            },
            child: ExpenseItem(expensesList[index]),
      ),
      ),
    );
  }
}