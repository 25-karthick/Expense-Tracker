import 'package:expense_tracker/Expenses List/expensesListwidget.dart';
import 'package:expense_tracker/Expenses%20List/NewExpenses.dart';
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

  ];
  void _showundersheet(){
    showModalBottomSheet(context: context, builder: (ctx)=> NewExpense(onaddexpense:addexpense));
}
  void addexpense(Expenses ex){
    setState(() {
      ExpenseList.add(ex);
    });
  }

  void removeexpenses(Expenses expense){
    setState(() {
      ExpenseList.remove(expense);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Expense Tracker",style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.deepPurple,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue,
              ),
              child: IconButton(onPressed: _showundersheet,
                icon: Icon(Icons.add,color: Colors.deepPurple,size: 30,),),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          ExpensesList(expensesList: ExpenseList,onremoveexpense: removeexpenses,),
        ],
      ),
    );
  }
}