import 'package:flutter/material.dart';

class StatisticsView extends StatelessWidget {
  const StatisticsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Text(
                  'Statistics View',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Container(
                    color: Colors.blue,
                    height: 100,
                    child: const Center(child: Text('Chart 1')),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.blue,
                    height: 100,
                    child: const Center(child: Text('Chart 1')),
                  ),
                ),
                const SizedBox(width: 16),
                Text(
                  'Statistics View',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
