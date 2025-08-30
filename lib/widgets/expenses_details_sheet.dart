// import 'package:expense_tracker/models/expense_model.dart';
// import 'package:flutter/material.dart';

// class ExpensesDetailsSheet extends StatelessWidget {
//   const ExpensesDetailsSheet({super.key, required this.expense});
//   final Expense expense;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: Column(
//         children: [
//           const SizedBox(height: 16),
//           Text(
//             '${expense.amount}\$',
//             style: Theme.of(context).textTheme.titleLarge,
//           ),
//           const SizedBox(height: 16),
//           Text(
//             'Transaction Details',
//             style: Theme.of(context).textTheme.titleLarge,
//           ),
//           const SizedBox(height: 16),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text('Date:', style: Theme.of(
//                   context,
//                 ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),),
//               Text(
//                 expense.date.toString().substring(0, 11),
//                 style: Theme.of(context).textTheme.bodyLarge,
//               ),
//             ],
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text('Category:', style: Theme.of(
//                   context,
//                 ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),),
//               Text(
//                 expense.category,
//                 style: Theme.of(context).textTheme.bodyLarge,
//               ),
//             ],
//           ),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 'Description:',
//                 style: Theme.of(
//                   context,
//                 ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(height: 4),
//               Text(
//                 expense.description,
//                 style: Theme.of(context).textTheme.bodyMedium,
//                 softWrap: true,
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:expense_tracker/models/expense_model.dart';
import 'package:expense_tracker/views/edit_expense_view.dart';
import 'package:expense_tracker/widgets/action_outlined_buttom.dart';
import 'package:expense_tracker/widgets/simple_outlined_buttom.dart';
import 'package:flutter/material.dart';

class ExpensesDetailsSheet extends StatelessWidget {
  const ExpensesDetailsSheet({super.key, required this.expense});
  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: Text(
                '${expense.amount}\$',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: Text(
                'Transaction Details',
                style: Theme.of(
                  context,
                ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(height: 20),
            Divider(color: Colors.grey.shade400),
            const SizedBox(height: 12),

            // Date
            Text(
              'Date:',
              style: Theme.of(
                context,
              ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(
              expense.date.toString().substring(0, 11),
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 16),

            // Category
            Text(
              'Category:',
              style: Theme.of(
                context,
              ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(
              expense.category ?? 'No Category',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 16),

            // Description
            Text(
              'Description:',
              style: Theme.of(
                context,
              ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(
              expense.description ?? 'No Description',
              style: Theme.of(context).textTheme.bodyMedium,
              softWrap: true,
            ),
            const SizedBox(height: 24),
            
            Center(
              child: ActionOutlinedButtom(text: 'Edit',onPressed: () {
                // Navigate to the edit expense view
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => EditExpenseView(expense: expense,),
                  ),
                );
              },),
            ),
          ],
        ),
      ),
    );
  }
}

