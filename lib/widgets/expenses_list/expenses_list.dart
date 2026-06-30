import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expenses_list/expense_item.dart';
import 'package:flutter/material.dart';

//Wiget för att visa lista med utgifter

class ExpensesList extends StatelessWidget {
  const ExpensesList({required this.expensesList, required this.onRemoveExpense, super.key});

  final void Function(Expense expense) onRemoveExpense;

  final List<Expense> expensesList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expensesList.length,
      itemBuilder: (ctx, index) => Dismissible(
        background: Container(color: Theme.of(context).colorScheme.error.withValues(alpha: 0.5)),
        onDismissed: (direction) {
          onRemoveExpense(expensesList[index]);
        },
        key: ValueKey(expensesList[index]),
        child: ExpenseItem(
          expensesList[index],
        ),
      ),
    );
  }
}
