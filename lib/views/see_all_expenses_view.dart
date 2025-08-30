import 'package:expense_tracker/widgets/expenses_listview.dart';
import 'package:flutter/material.dart';

class SeeAllExpensesView extends StatelessWidget {
  const SeeAllExpensesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Expenses'),
      ),
      body: CustomScrollView(
        slivers: [
          HomeExpensesListViewBuilder(),
        ],
      ),
    );
  }
}