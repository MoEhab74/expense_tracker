import 'package:flutter/material.dart';

class HomeCardInfo extends StatelessWidget {
  const HomeCardInfo({
    super.key,
    required this.balanceText,
    required this.balanceAmount,
    this.incomeIxpenseColor, this.icon, this.amountWeight, this.amountSize,
  });
  final String balanceText,
      balanceAmount;
  final Color? incomeIxpenseColor;
  final IconData? icon;
  final FontWeight? amountWeight;
  final double? amountSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            // variable
            balanceText,
            style: TextStyle(
              // variable
              color: incomeIxpenseColor ?? Theme.of(context).colorScheme.onPrimary,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            // variable
            balanceAmount,
            style: TextStyle(
              // variable
              color: Theme.of(context).colorScheme.onPrimary,
              // variable
              fontSize: amountSize ?? 24,
              fontWeight: amountWeight ?? FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
