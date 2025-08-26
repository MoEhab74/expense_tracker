import 'package:flutter/material.dart';

class MyElevatedButtom extends StatelessWidget {
  const MyElevatedButtom({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor,
  });
  final String text;
  final VoidCallback onPressed;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 16),
        backgroundColor:
            backgroundColor ?? Theme.of(context).colorScheme.surfaceContainer,
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: backgroundColor != null
              ? Theme.of(context).colorScheme.onPrimary
              : null,
        ),
      ),
    );
  }
}
