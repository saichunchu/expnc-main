import 'package:expnc/models/expense.dart';
// import 'package:expnc/widgets/expenses.dart';
import 'package:expnc/widgets/expenses_list/expenses_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(
      {super.key, required this.expenses, required this.onRemoveExpense});

  final List<Expense> expenses;
  final void Function(Expense expense) onRemoveExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: expenses.length,
        itemBuilder: (ctx, index) => Dismissible(
              key: ValueKey(expenses[index]),
              onDismissed: (direction) {
                onRemoveExpense(expenses[index]);
                DismissDirection.endToStart;
              },
              background: Container(
                color: Colors.red, // Background color when swiping
              ),
              child: ExpenseItem(expenses[index]),
            ));
  }
}
