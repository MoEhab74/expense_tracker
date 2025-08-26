import 'package:expense_tracker/widgets/transactions_details_sheet.dart';
import 'package:flutter/material.dart';

class HomeTransactionsListView extends StatelessWidget {
  const HomeTransactionsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        return Padding(
          padding: const EdgeInsets.all(0.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              onTap: () => {
                // Show transaction details and pass the current transaction to the details screen
                showModalBottomSheet(
                  backgroundColor: Theme.of(context).colorScheme.surface,
                  context: context, builder: (context){
                  
                  return TransactionsDetailsSheet();
                })
              },
              tileColor: Theme.of(context).colorScheme.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              title: Text(
                'Title',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              subtitle: Text(
                'Date',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
              trailing: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.delete,
                  size: 32,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
            ),
          ),
        );
      }, childCount: 10),
    );
  }
}

/*
Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    RichText(text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Title\n',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onPrimary,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        TextSpan(
                          text: 'Date',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onPrimary,
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    )),
                    Text('SR 1000', style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),),
                ],),
              ),
           */
