import 'package:flutter/material.dart';

import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

enum ExpenseCategory {
  food,
  travel,
  leisure,
  work,
}

const expenseCategoryToIcon = {
  ExpenseCategory.food: Icons.lunch_dining,
  ExpenseCategory.travel: Icons.flight_takeoff,
  ExpenseCategory.work: Icons.work,
  ExpenseCategory.leisure: Icons.movie,
};

class Expense {
  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = Uuid().v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final ExpenseCategory category;

  String get formattedDate {
    return DateFormat.yMd().format(date);
  }
}