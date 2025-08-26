import 'package:flutter/material.dart';

class SimpleOutlinedButtom extends StatelessWidget {
  const SimpleOutlinedButtom({
    super.key,
    this.backgroundColor,
    required this.text, this.onPressed,
  });
  final Color? backgroundColor;
  final String text;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 300,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          backgroundColor:
              backgroundColor ?? Theme.of(context).colorScheme.onPrimary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32),
          ),
        ),
        onPressed: onPressed,
        child: Text(text, style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
