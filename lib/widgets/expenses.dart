import 'package:expense_tracker/widgets/chart/chart.dart';
import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker/widgets/new_expenses.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
      title: 'Flutter course',
      amount: 99.99,
      category: Category.travel,
      date: DateTime.now(),
    ),
    Expense(
      title: 'Bootcamp',
      amount: 12.25,
      category: Category.leisure,
      date: DateTime.now(),
    ),
  ];

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
    ScaffoldMessenger.of(context).clearSnackBars(); // ta bort ev. gamla snackbars
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        persist: false,
        content: Text("Expense Deleted"),
        duration: Duration(seconds: 4),
        action: SnackBarAction(
          label: "Undo",
          onPressed: () {
            setState(() {
              _registeredExpenses.insert(expenseIndex, expense);
            });
          },
        ),
      ),
    );
  }

  void _openExpenseOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpenses(onAddexpense: _addExpense),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = Center(child: const Text("No Expense Data found..."));

    return Scaffold(
      appBar: AppBar(
        title: const Text("Fluttter Expense Tracker"),
        actions: [
          IconButton(
            onPressed: _openExpenseOverlay,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          Chart(expenses: _registeredExpenses),
          Expanded(
            child: _registeredExpenses.isNotEmpty
                ? ExpensesList(
                    expensesList: _registeredExpenses,
                    onRemoveExpense: _removeExpense,
                  )
                : mainContent,
          ),
        ],
      ),
    );
  }
}
