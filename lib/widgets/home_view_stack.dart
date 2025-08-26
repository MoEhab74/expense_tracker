import 'package:expense_tracker/views/profile_view.dart';
import 'package:expense_tracker/widgets/balance_card.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeViewStack extends StatelessWidget {
  const HomeViewStack({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Image.asset('assets/images/appbar.jpg'),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Good morning,',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimary,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        // Navigate to profile page
                        Navigator.pushNamed(context, ProfileView.profileRoute);
                      },
                      child: Text(
                        FirebaseAuth.instance.currentUser?.email ?? 'User',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimary,
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ],
                ),

                IconButton(
                  icon: Icon(
                    Icons.search,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 116,
          left: 12,
          right: 12,
          child: SizedBox(width: 300, height: 200, child: BalanceCard()),
        ),
      ],
    );
  }
}
