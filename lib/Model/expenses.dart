import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

const uuid=Uuid();
final formatter=DateFormat.yMd();
enum Category{ID,FOOD,TRAVEL,OTHERS}

const CategoryIcon={
  Category.TRAVEL: Icons.flight,
  Category.ID:Icons.perm_identity,
  Category.FOOD:Icons.fastfood,
  Category.OTHERS:Icons.no_accounts,
};

class Expenses{
  Expenses({
    required this.title,
    required this.amount,
    required this.date,
    required this.Categories,
  } ): id = uuid.v4();
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category Categories;

  String get FormatDate{
    return formatter.format(date);
  }
}