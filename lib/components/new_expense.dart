import 'package:expense_tracker/data/models/expense.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewExpenseDialog extends StatefulWidget {
  const NewExpenseDialog({super.key, required this.onAddNewExpense});

  final void Function(Expense) onAddNewExpense;

  @override
  State<NewExpenseDialog> createState() => _NewExpenseDialogState();
}

class _NewExpenseDialogState extends State<NewExpenseDialog> {
  final _titleTextController = TextEditingController();
  final _amountTextController = TextEditingController();

  ExpenseCategory _selectedCategory = ExpenseCategory.food;
  DateTime? _selectedDate;

  void _showDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);

    final selectedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: firstDate,
      lastDate: now,
    );

    setState(() {
      _selectedDate = selectedDate;
    });
  }

  void _submitExpenseData() {
    final enteredAmount = double.tryParse(_amountTextController.text);
    final amountIsInvalid = enteredAmount == null || enteredAmount < 0;
    
    final neededShowError =
        _titleTextController.text.trim().isEmpty ||
        amountIsInvalid ||
        _selectedDate == null;

    if (neededShowError) {
      showDialog(
        context: context, 
        builder: (context) => AlertDialog(
          title: const Text('Invalid input'),
          content: const Text('Please make sure a valid input data'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Ok'))
          ],
        ));
        return;
    }

    widget.onAddNewExpense(
      Expense(
        title: _titleTextController.text,
        amount: enteredAmount,
        date: _selectedDate!,
        category: _selectedCategory,
      ),
    );

    Navigator.pop(context);
  }

  @override
  void dispose() {
    _titleTextController.dispose();
    _amountTextController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 48.0, 16.0, 16.0), 
      child: Column(
        children: [
          TextField(
            controller: _titleTextController,
            maxLength: 50,
            decoration: InputDecoration(
              label: Text('Title'),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _amountTextController,
                  maxLength: 50,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    prefixText: '\$',
                    label: Text('Amount'),
                  ),
                ),
              ),
              const SizedBox(width: 8.0,),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      _selectedDate == null
                          ? 'No date'
                          : DateFormat.yMd().format(_selectedDate!),
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    IconButton(
                      onPressed: _showDatePicker,
                      icon: Icon(Icons.calendar_month)),
                  ],
                ))
            ],
          ),
          const SizedBox(height: 10.0,),
          Row(
            children: [
              DropdownButton(
                value: _selectedCategory,
                items: ExpenseCategory.values
                    .map(
                      (category) => DropdownMenuItem(
                        value: category,
                        child: Text(category.name.toUpperCase()),
                      ),
                    ).toList(),
                onChanged: (value) {
                  if (value == null) return;

                  setState(() {
                    _selectedCategory = value;
                  });
                },
              ),
              const Spacer(),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Cancel',
                  style: Theme.of(context).textTheme.labelMedium),
              ),
              const SizedBox(width: 10.0,),
              ElevatedButton(
                onPressed: _submitExpenseData,
                child: Text(
                  'Submit',
                  style: Theme.of(context).textTheme.labelMedium),
              ),
            ],
          )
        ],
      ),
    );
  }
}