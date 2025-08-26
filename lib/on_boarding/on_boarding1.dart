import 'package:flutter/material.dart';

class OnBoarding1 extends StatelessWidget {
  const OnBoarding1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.attach_money,
             size: 120,
             color: Theme.of(context).colorScheme.onPrimary,),
             Text('Expense Tracker', 
             style: TextStyle(
              color: Theme.of(context).colorScheme.onSecondary,
              fontSize: 30,)),
             ],
        ),
      ),
    );
  
  }
}
