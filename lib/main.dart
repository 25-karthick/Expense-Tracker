import 'package:flutter/material.dart';
import 'package:expense_tracker/Expenses List/expense.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async{
  await initializeDateFormatting();
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Expense(),
  ));
}