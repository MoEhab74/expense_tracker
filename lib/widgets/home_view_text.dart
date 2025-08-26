import 'package:flutter/material.dart';

class HomeViewText extends StatelessWidget {
  const HomeViewText({
    super.key, required this.text, this.fontSize,
  });
  final String text;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize ?? 18,
        fontWeight: FontWeight.bold,
        color: Theme.of(context).colorScheme.onSurfaceVariant,
      ),
    );
  }
}
