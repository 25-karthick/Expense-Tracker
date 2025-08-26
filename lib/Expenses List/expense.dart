import 'package:expense_tracker/Expenses List/expensesListwidget.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/Model/expenses.dart';

class Expense extends StatefulWidget{
  const Expense({super.key});
  @override
  State<StatefulWidget> createState() {
    return _expensetrack();
  }
}
class _expensetrack extends State<Expense>{
  final List<Expenses> ExpenseList = [
    Expenses(title: 'Id' , amount: 15.0, date: DateTime.now(), Categories: Category.ID),
    Expenses(title: 'Food' , amount: 150.0, date: DateTime.now(), Categories: Category.FOOD),
    Expenses(title: 'Food' , amount: 150.0, date: DateTime.now(), Categories: Category.FOOD),
    Expenses(title: 'Food' , amount: 150.0, date: DateTime.now(), Categories: Category.FOOD),
    Expenses(title: 'Food' , amount: 150.0, date: DateTime.now(), Categories: Category.FOOD),
    Expenses(title: 'Food' , amount: 150.0, date: DateTime.now(), Categories: Category.FOOD),
    Expenses(title: 'Food' , amount: 150.0, date: DateTime.now(), Categories: Category.FOOD),
    Expenses(title: 'Food' , amount: 150.0, date: DateTime.now(), Categories: Category.FOOD),
    Expenses(title: 'Food' , amount: 150.0, date: DateTime.now(), Categories: Category.FOOD),
    Expenses(title: 'Food' , amount: 150.0, date: DateTime.now(), Categories: Category.FOOD),
    Expenses(title: 'Fod' , amount: 150.0, date: DateTime.now(), Categories: Category.FOOD),
    Expenses(title: 'Food' , amount: 150.0, date: DateTime.now(), Categories: Category.FOOD),
    Expenses(title: 'Food' , amount: 150.0, date: DateTime.now(), Categories: Category.FOOD),
    Expenses(title: 'Food' , amount: 150.0, date: DateTime.now(), Categories: Category.FOOD),
    Expenses(title: 'Food' , amount: 150.0, date: DateTime.now(), Categories: Category.FOOD),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text('Hello world'),
          ExpensesList(expensesList: ExpenseList,),
        ],
      ),
    );
  }
}