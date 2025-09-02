import 'package:expense_tracker/cubits/expenses_cubit/expenses_cubit.dart';
import 'package:expense_tracker/cubits/expenses_cubit/expenses_states.dart';
import 'package:expense_tracker/helper/helper_dialog.dart';
import 'package:expense_tracker/widgets/expenses_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeExpensesListViewBuilder extends StatelessWidget {
  const HomeExpensesListViewBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    // Where is the provider of this cubit??????!
    return BlocConsumer<ExpensesCubit, ExpensesState>(
      listener: (context, state) {
        if (state is ExpensesError) {
          showDialogBox(context, state.message);
        }
      },
      builder: (context, state) {
        if (state is ExpensesLoadedSuccessfully) {
          if (state.expenses.isEmpty) {
            return const SliverToBoxAdapter(
              child: SizedBox(
                height: 300,
                child: Center(
                  child: Text(
                    'No expenses found',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
              ),
            );
          }
          return SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return Padding(
                padding: const EdgeInsets.all(0.0),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ExpenseListTile(expense: state.expenses[index]),
                ),
              );
            }, childCount: state.expenses.length),
          );
        }
        return const SliverToBoxAdapter(
          child: Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
