import 'package:expnc/widgets/charts/chart.dart';
import 'package:expnc/widgets/expenses_list/expenses_list.dart';
import 'package:expnc/widgets/new_expense.dart';
import 'package:flutter/material.dart';
import 'package:expnc/models/expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});
  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
        title: 'Flutter course ',
        amount: 20.0,
        date: DateTime.now(),
        category: Category.work),
    Expense(
        title: 'cinema',
        amount: 50.0,
        date: DateTime.now(),
        category: Category.leisure),
  ];

  void _openAddExpense() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Allows modal to resize when keyboard appears
      backgroundColor:
          Colors.transparent, // Transparent background for custom styling
      elevation: 10, // Higher elevation for shadow effect
      builder: (ctx) {
        return GestureDetector(
          onTap: () {}, // Close keyboard when tapping outside text fields
          child: DraggableScrollableSheet(
            expand: false, // Prevents modal from fully expanding at the start
            initialChildSize:
                0.6, // Initial size of modal (60% of screen height)
            minChildSize: 0.4, // Minimum size (40% of screen height)
            maxChildSize: 0.9, // Maximum size (90% of screen height)
            builder: (_, scrollController) {
              return Container(
                decoration: const BoxDecoration(
                  color: Color(0xFFF0F4F8),
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(25), // Rounded top corners
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10, // Blurry shadow for depth
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    // Stylish Drag Handle
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      height: 6,
                      width: 60,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(3),
                      ),
                    ),

                    // The body of the modal will go here
                    Expanded(
                      child: SingleChildScrollView(
                        controller:
                            scrollController, // Enables scrolling inside modal
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: NewExpense(
                              onAddExpense: _addExpense), // Your content
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    final expenseIndex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: const Text("Expense Deleted"),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              _registeredExpenses.insert(expenseIndex, expense);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    Widget mainContent = const Center(child: Text("No Expenses Found"));

    if (_registeredExpenses.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: _registeredExpenses,
        onRemoveExpense: _removeExpense,
      );
    }
    ;
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(onPressed: _openAddExpense, icon: const Icon(Icons.add)),
          ],
          title: const Text('Xpenc'),
        ),
        body: width < 600
            ? Column(
                children: [
                  //can add toolbar here too//
                  Chart(expenses: _registeredExpenses),
                  Expanded(child: mainContent),
                ],
              )
            : Row(
                children: [
                  Expanded(child: Chart(expenses: _registeredExpenses)),
                  Expanded(child: mainContent),
                ],
              ));
  }
}
