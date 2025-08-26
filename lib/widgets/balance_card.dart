import 'package:expense_tracker/widgets/home_card_info.dart';
import 'package:flutter/material.dart';

class BalanceCard extends StatelessWidget {
  const BalanceCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      color: Theme.of(context).colorScheme.primary,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 14,
              vertical: 12,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                HomeCardInfo(
                  balanceText: 'Total Balance',
                  balanceAmount: 'Rs. 0.00',
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.more_horiz,
                    color: Theme.of(
                      context,
                    ).colorScheme.onPrimary,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 14,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                HomeCardInfo(
                  balanceText: 'Income',
                  balanceAmount: 'Rs. 0.00',
                  incomeIxpenseColor: Theme.of(
                    context,
                  ).colorScheme.onPrimary,
                  amountWeight: FontWeight.w500,
                  amountSize: 16,
                ),
                HomeCardInfo(
                  balanceText: 'Expense',
                  balanceAmount: 'Rs. 0.00',
                  incomeIxpenseColor: Theme.of(
                    context,
                  ).colorScheme.onPrimary,
                  amountWeight: FontWeight.w500,
                  amountSize: 16,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}