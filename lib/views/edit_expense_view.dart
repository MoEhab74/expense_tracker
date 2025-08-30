import 'package:expense_tracker/models/expense_model.dart';
import 'package:expense_tracker/widgets/edit_expense_body.dart';
import 'package:flutter/material.dart';

class EditExpenseView extends StatelessWidget {
  const EditExpenseView({super.key, required this.expense});

  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Expense')),
      body: EditExpenseBody(expense: expense),
    );
  }
}
