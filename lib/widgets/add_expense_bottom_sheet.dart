import 'package:expense_tracker/widgets/add_expense_form.dart';
import 'package:flutter/material.dart';

class AddExpenseBottomSheet extends StatelessWidget {
  const AddExpenseBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
              padding: EdgeInsets.only(
                left: 8,
                right: 8,
                // Make the screen of bottom sheet flixable with yhe keyboard
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: SingleChildScrollView(child: const AddExpenseForm()),
            );
  }
}
