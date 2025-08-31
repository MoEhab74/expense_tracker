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

    final total = BlocProvider.of<ExpensesCubit>(context).getTotalExpenses();
    final biggest = BlocProvider.of<ExpensesCubit>(context).getBiggestExpenseAmount();
    final smallest = BlocProvider.of<ExpensesCubit>(context).getSmallestExpenseAmount();
    final average = BlocProvider.of<ExpensesCubit>(context).getAverageExpenseAmount();

    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            /// 🔹 Pie Chart
            SizedBox(
              height: 285,
              width: double.infinity,
              child: PieChart(
                PieChartData(
                  sections: dataMap.entries.map((entry) {
                    final index = keys.indexOf(entry.key);
                    final color = Colors.primaries[index % Colors.primaries.length];
      
                    return PieChartSectionData(
                      value: entry.value,
                      title: entry.value.toStringAsFixed(1),
                      color: color,
                      radius: 80,
                      titleStyle: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    );
                  }).toList(),
                  sectionsSpace: 2,
                  centerSpaceRadius: 60,
                ),
              ),
            ),
      
            const SizedBox(height: 8),
      
            /// 🔹 Legend
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
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
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
      
            const SizedBox(height: 16),
      
            /// 🔹 Stats in GridView (Cards)
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 1.3,
              children: [
                _buildStatCard(context, "Total", "${total.toStringAsFixed(2)}\$"),
                _buildStatCard(context, "Biggest", "${biggest.toStringAsFixed(2)}\$"),
                _buildStatCard(context, "Smallest", "${smallest.toStringAsFixed(2)}\$"),
                _buildStatCard(context, "Average", "${average.toStringAsFixed(2)}\$"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(BuildContext context, String title, String value) {
    return Card(
      color: Theme.of(context).colorScheme.primaryContainer,
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    )),
            const SizedBox(height: 8),
            Text(value,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    )),
          ],
        ),
      ),
    );
  }
}
