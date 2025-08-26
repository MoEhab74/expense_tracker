import 'package:expense_tracker/widgets/add_expense_bottom_sheet.dart';
import 'package:expense_tracker/views/statistics_view.dart';
import 'package:expense_tracker/widgets/home_view_stack.dart';
import 'package:expense_tracker/widgets/home_view_text.dart';
import 'package:expense_tracker/widgets/transactions_listview.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});
  static const String homeRoute = 'HomeView';

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        onPressed: () {
          showModalBottomSheet(
            backgroundColor: Theme.of(context).colorScheme.surface,
            // Make the bottom sheet scrollable
            isScrollControlled: true,
            context: context,
            builder: (context) {
              return const AddExpenseBottomSheet();
            },
          );
        },
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) => setState(() => selectedIndex = index),
        backgroundColor: Theme.of(context).colorScheme.surface,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Theme.of(context).colorScheme.secondary,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        // BottomNavigationBarType.fixed is used to keep the labels always visible
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 30),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.chartColumn, size: 30),
            label: "Statistics",
          ),
        ],
      ),
      // IndexedStack for switching between Home and Statistics views without rebuilding the entire widget tree
      body: IndexedStack(
        index: selectedIndex,
        children: [
          CustomScrollView(
            slivers: [
              SliverToBoxAdapter(child: HomeViewStack()),
              const SliverToBoxAdapter(child: SizedBox(height: 20)),
              SliverToBoxAdapter(
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        HomeViewText(text: 'History of transactions'),
                      ],
                    ),
                  ),
                ),
              ),
              HomeTransactionsListView(),
            ],
          ),
          StatisticsView(),
        ],
      ),
    );
  }
}
