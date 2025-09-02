import 'package:expense_tracker/cubits/expenses_cubit/expenses_cubit.dart';
import 'package:expense_tracker/cubits/expenses_cubit/expenses_states.dart';
import 'package:expense_tracker/widgets/home_card_info.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BalanceCard extends StatelessWidget {
  const BalanceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExpensesCubit, ExpensesState>(
      builder: (context, state) {
        return Card(
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          color: Theme.of(context).colorScheme.primary,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 12,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    HomeCardInfo(
                      balanceText: 'Total Balance',
                      balanceAmount:
                          '${context.read<ExpensesCubit>().getTotalExpenses().toStringAsFixed(2)} \$',
                    ),
                    GestureDetector(
                      onTap: () {
                        // Delete account action
                        deleteUserAccountDialog(context);
                      },
                      child: Text(
                        'Delete Account',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimary,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    HomeCardInfo(
                      balanceText: 'Last Income',
                      balanceAmount:
                          '${context.read<ExpensesCubit>().getLastExpenseAmount().toStringAsFixed(2)} \$',
                      incomeIxpenseColor: Theme.of(
                        context,
                      ).colorScheme.onPrimary,
                      amountWeight: FontWeight.w500,
                      amountSize: 16,
                    ),
                    GestureDetector(
                      onTap: () {
                        // Clear expenses action
                        clearExpensesDialog(context);
                      },
                      child: Text(
                        'Clear expenses',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimary,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void deleteUserAccountDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Delete Account'),
          content: Text('Are you sure you want to delete your account?'),
          actions: [
            TextButton(
              onPressed: () async {
                // Handle account deletion
                await FirebaseAuth.instance.currentUser!.delete();
                Navigator.of(context).pop();
              },
              child: Text('Delete'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  void clearExpensesDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Delete Expenses'),
          content: Text('Are you sure you want to delete all expenses?'),
          actions: [
            TextButton(
              onPressed: () {
                // Handle account deletion
                context.read<ExpensesCubit>().clearAllExpenses();
                Navigator.of(context).pop();
              },
              child: Text('Delete'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }
}
