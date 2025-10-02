import 'package:expense_tracker/components/chart/chart.dart';
import 'package:expense_tracker/components/new_expense.dart';
import 'package:flutter/material.dart';

import 'package:expense_tracker/data/models/expense.dart';

import 'package:expense_tracker/components/expenses_list/expenses_list.dart';

class ExpencesScreen extends StatefulWidget {
  const ExpencesScreen({super.key});

  @override
  State<ExpencesScreen> createState() => _ExpencesScreenState();
}

class _ExpencesScreenState extends State<ExpencesScreen> {
  final List<Expense> _expenses = [
    Expense(
      title: 'Sluts',
      amount: 300.0,
      date: DateTime.now(),
      category: ExpenseCategory.work,
    ),
    Expense(
      title: 'BlackJack',
      amount: 1234.99,
      date: DateTime.now(),
      category: ExpenseCategory.leisure,
    ),
  ];

  void _showAddingNewExpenseOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context, 
      builder: (context) {
        return NewExpenseDialog(onAddNewExpense: _addExpense);
      });
  }

  void _addExpense(Expense expense) {
    setState(() {
      _expenses.add(expense);
    });
  }

  void _insertExpense(int index, Expense expense) {
    setState(() {
      _expenses.insert(index, expense);
    });
  }

  void _removeExpense(Expense expense) {
    final index = _expenses.indexOf(expense);

    setState(() {
      _expenses.remove(expense);
    });
    
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: const Text('Expense deleted'),
        action: SnackBarAction(
          label: 'Undo', 
          onPressed: () {
            _insertExpense(index, expense);
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Tracker'),
        actions: [
          IconButton(
            onPressed: _showAddingNewExpenseOverlay,
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Chart(expenses: _expenses),
            SizedBox(height: 20.0,),
            Expanded(
              child: _expenses.isNotEmpty
                  ? ExpensesList(
                      expences: _expenses,
                      onRemoveExpense: _removeExpense,
                    )
                  : Center(child: Text('No expenses, start adding some')),
            ),
          ],
        ),
      ),
    );
  }
}