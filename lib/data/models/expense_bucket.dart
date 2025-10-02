import 'expense.dart';

class ExpenseBucket {
  const ExpenseBucket({
    required this.category,
    required this.expences
  });

  ExpenseBucket.category(List<Expense> expencesList, this.category)
    : expences = expencesList
          .where((item) => item.category == category)
          .toList();

  final ExpenseCategory category;
  final List<Expense> expences;

  double get totalExpenses {
    return expences.fold(0.0, (sum, expense) => sum + expense.amount);
  }
}