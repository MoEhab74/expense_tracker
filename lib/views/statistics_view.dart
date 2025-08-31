import 'package:expense_tracker/cubits/add_expense_cubit/add_expense_cubit.dart';
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
    final dataMap = context.read<ExpensesCubit>().getTotalAmountByCategory();
    return BlocProvider(
      create: (context) => AddExpenseCubit(),
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: StatisticsViewBody(dataMap: dataMap),
        ),
      ),
    );
  }
}
