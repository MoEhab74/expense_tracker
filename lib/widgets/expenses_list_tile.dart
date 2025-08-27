import 'package:expense_tracker/cubits/expenses_cubit/expenses_cubit.dart';
import 'package:expense_tracker/models/expense_model.dart';
import 'package:expense_tracker/widgets/expenses_details_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExpenseListTile extends StatelessWidget {
  const ExpenseListTile({super.key, required this.expense});

  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => {
        // Show transaction details and pass the current transaction to the details screen
        showModalBottomSheet(
          backgroundColor: Theme.of(context).colorScheme.surface,
          context: context,
          builder: (context) {
            return ExpensesDetailsSheet();
          },
        ),
      },
      tileColor: Theme.of(context).colorScheme.primary,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      title: Text(
        expense.title,
        style: TextStyle(
          color: Theme.of(context).colorScheme.onPrimary,
          fontSize: 16,
          fontWeight: FontWeight.w700,
        ),
      ),
      subtitle: Text(
        expense.date.toString().substring(0, 11),
        style: TextStyle(
          color: Theme.of(context).colorScheme.onPrimary,
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: IconButton(
        onPressed: () {
          // Delete expense
          expense.delete();
          // Fetch all expenses to update the list of expenses
          context.read<ExpensesCubit>().fetchAllExpenses();
        },
        icon: Icon(
          Icons.delete,
          size: 32,
          color: Theme.of(context).colorScheme.onPrimary,
        ),
      ),
    );
  }
}
