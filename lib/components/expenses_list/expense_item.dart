import 'package:expense_tracker/data/models/expense.dart';
import 'package:flutter/material.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem(this.expense, {super.key});

  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              expense.title,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(height: 4.0,),
            Row(children: [
              Text(
                '\$ ${expense.amount.toStringAsFixed(2)}',
                style: Theme.of(context).textTheme.labelSmall),
              const Spacer(),
              Row(
                children: [
                  Icon(expenseCategoryToIcon[expense.category]),
                  SizedBox(width: 6.0,),
                  Text(
                    expense.formattedDate,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ],
              )
            ],),
          ],
        ),
      ),
    );
  }
}