import 'package:flutter/material.dart';

class TransactionsDetailsSheet extends StatelessWidget {
  const TransactionsDetailsSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const SizedBox(height: 16),
          Text('1500\$', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 16),
          Text(
            'Transaction Details',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Date:', style: Theme.of(context).textTheme.bodyLarge),
              Text('2023-10-10', style: Theme.of(context).textTheme.bodyLarge),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Category:', style: Theme.of(context).textTheme.bodyLarge),
              Text('Food', style: Theme.of(context).textTheme.bodyLarge),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Notes:', style: Theme.of(context).textTheme.bodyLarge),
              Text(
                'Dinner with friends',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              ],
          ),
        ],
      ),
    );
  }
}
