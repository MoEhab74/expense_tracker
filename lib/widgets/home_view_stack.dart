import 'package:expense_tracker/cubits/expenses_cubit/expenses_cubit.dart';
import 'package:expense_tracker/views/profile_view.dart';
import 'package:expense_tracker/widgets/balance_card.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeViewStack extends StatefulWidget {
  const HomeViewStack({super.key});

  @override
  State<HomeViewStack> createState() => _HomeViewStackState();
}

class _HomeViewStackState extends State<HomeViewStack> {
  final TextEditingController _searchController = TextEditingController();

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
                        FirebaseAuth.instance.currentUser!.email!,
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
                  onPressed: () {
                    // Search Dialog
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        content: SizedBox(
                          height: 150,
                          width: 250,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SearchField(searchController: _searchController),
                              const SizedBox(height: 16),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).pop();

                                  // Handle search action
                                  // Trigger the search method from the ExpensesCubit
                                  BlocProvider.of<ExpensesCubit>(
                                    context,
                                  ).searchForExpenseByTitle(
                                    _searchController.text,
                                  );

                                  _searchController.clear();
                                },
                                child: const Text('OK'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 116,
          left: 12,
          right: 12,
          child: SizedBox(
            width: 300,
            height: 200,
            child: BalanceCard(),
          ), // Rebuild BalanceCard according to the total expenses
        ),
      ],
    );
  }
}

class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
    required TextEditingController searchController,
  }) : _searchController = searchController;

  final TextEditingController _searchController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _searchController,
      onSaved: (value) {
        // Save the search query
        _searchController.text = value ?? '';
      },
      decoration: InputDecoration(
        hintText: 'Search...',
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).colorScheme.primary),
          borderRadius: BorderRadius.circular(20),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).colorScheme.primary),
          borderRadius: BorderRadius.circular(20),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).colorScheme.error),
          borderRadius: BorderRadius.circular(20),
        ),
        border: const OutlineInputBorder(),
      ),
    );
  }
}
