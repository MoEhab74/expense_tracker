import 'package:expense_tracker/views/edit_expense_view.dart';
import 'package:flutter/material.dart';

class ActionOutlinedButtom extends StatelessWidget {
  const ActionOutlinedButtom({
    super.key, required this.text, this.onPressed,
  });
  final String text;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        minimumSize: WidgetStatePropertyAll(Size(200, 50)),
        backgroundColor: WidgetStateProperty.all<Color>(
          Theme.of(context).colorScheme.primary,
        ),
        foregroundColor: WidgetStateProperty.all<Color>(
          Theme.of(context).colorScheme.onPrimary,
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: Theme.of(context).colorScheme.onPrimary,
          fontWeight: FontWeight.w500,
          fontSize: 16,
        ),
      ),
    );
  }
}
