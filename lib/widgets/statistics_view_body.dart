import 'package:expense_tracker/cubits/expenses_cubit/expenses_cubit.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StatisticsViewBody extends StatelessWidget {
  const StatisticsViewBody({super.key, required this.dataMap});

  final Map<String, double> dataMap;

  @override
  Widget build(BuildContext context) {
    final keys = dataMap.keys.toList();

    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 300,
            width: 200,
            child: PieChart(
              PieChartData(
                sections: dataMap.entries.map((entry) {
                  final index = keys.indexOf(entry.key);
                  final color = Colors.primaries[index % Colors.primaries.length];

                  return PieChartSectionData(
                    value: entry.value,
                    // نخلي العنوان هو القيمة أو النسبة
                    title: entry.value.toStringAsFixed(1),
                    color: color,
                    radius: 60,
                    titleStyle: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  );
                }).toList(),
                sectionsSpace: 2,
                centerSpaceRadius: 40,
              ),
            ),
          ),

          const SizedBox(height: 16),

          /// 🔹 Legend Section
          Column(
            children: dataMap.entries.map((entry) {
              final index = keys.indexOf(entry.key);
              final color = Colors.primaries[index % Colors.primaries.length];

              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(width: 16, height: 16, color: color),
                    const SizedBox(width: 8),
                    Text(
                      '${entry.key}: ${entry.value.toStringAsFixed(2)}',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              );
            }).toList(),
          ),

          const SizedBox(height: 24),

          /// 🔹 Total Expenses Section
          Text(
            'Total Expenses: ${BlocProvider.of<ExpensesCubit>(context).getTotalExpenses().toStringAsFixed(2)}\$',
            style: Theme.of(context).textTheme.titleLarge,
          ),

          const SizedBox(height: 16),
          // the biggest expense
          Text(
            'Biggest Expense: ${BlocProvider.of<ExpensesCubit>(context).getBiggestExpenseAmount().toStringAsFixed(2)}\$',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 16),
          // the smallest expense
          Text(
            'Smallest Expense: ${BlocProvider.of<ExpensesCubit>(context).getSmallestExpenseAmount().toStringAsFixed(2)}\$',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 16),
          // the average expense
          Text(
            'Average Expense: ${BlocProvider.of<ExpensesCubit>(context).getAverageExpenseAmount().toStringAsFixed(2)}\$',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 24),
          // A Gridview for these features
          Expanded(
            child: SizedBox(
              height: 200,
              width: 200,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                itemBuilder: (context, index) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Feature ${index + 1}',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Description of feature ${index + 1}',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          )

        ],
      ),
    );
  }
}
