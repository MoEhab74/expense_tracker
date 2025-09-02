import 'package:expense_tracker/cubits/add_expense_cubit/add_expense_cubit.dart';
import 'package:expense_tracker/cubits/add_expense_cubit/add_expense_states.dart';
import 'package:expense_tracker/cubits/expenses_cubit/expenses_cubit.dart';
import 'package:expense_tracker/widgets/statistics_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StatisticsView extends StatefulWidget {
  const StatisticsView({super.key});

  @override
  State<StatisticsView> createState() => _StatisticsViewState();
}

class _StatisticsViewState extends State<StatisticsView> {
  // late Map<String, double> dataMap;

  @override
  Widget build(BuildContext context) {
    // bloc provider removed
    return BlocBuilder<AddExpenseCubit, AddExpenseState>(
      builder: (context, state) {
        final dataMap = context
            .read<ExpensesCubit>()
            .getTotalAmountByCategory();
        return state is AddExpenseSuccess
            ? Scaffold(
                backgroundColor: Theme.of(context).colorScheme.surface,
                body: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: StatisticsViewBody(dataMap: dataMap),
                ),
              )
            : Center(
                child: Text(
                  'Add expenses to view statistics',
                  style: TextStyle(fontSize: 24),
                ),
              );
      },
    );
  }
}
