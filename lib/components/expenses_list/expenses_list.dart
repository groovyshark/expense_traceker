import 'package:flutter/material.dart';

import 'package:expense_tracker/data/models/expense.dart';
import 'package:expense_tracker/components/expenses_list/expense_item.dart';

class ExpensesList extends StatefulWidget {
  const ExpensesList({super.key, required this.expences, required this.onRemoveExpense});

  final List<Expense> expences;
  final void Function(Expense) onRemoveExpense;
  
  @override
  State<StatefulWidget> createState() {
    return _ExpensesListState();
  }
}

class _ExpensesListState extends State<ExpensesList> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        final expense = widget.expences[index];
        return Dismissible(
          background: Container(
            color: Theme.of(context).colorScheme.error.withValues(alpha: 0.85),
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.only(right: 20.0),
            margin: Theme.of(context).cardTheme.margin,
            child: Icon(Icons.delete, color: Colors.white),
          ),
          onDismissed: (direction) {
            widget.onRemoveExpense(expense);
          },
          key: ValueKey(expense),
          child: ExpenseItem(expense),
        );
      },
      separatorBuilder: (_, _) => SizedBox(height: 4.0,),
      itemCount: widget.expences.length,
    );
  }
}