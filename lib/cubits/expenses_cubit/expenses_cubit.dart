import 'package:expense_tracker/cubits/expenses_cubit/expenses_states.dart';
import 'package:expense_tracker/models/expense_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

class ExpensesCubit extends Cubit<ExpensesState> {
  ExpensesCubit() : super(ExpensesInitial());

  List<Expense>? expenses;
  double totalExpenses = 0;
  // final String _userEmail = FirebaseAuth.instance.currentUser!.email!;

  List<String> categories = [
    'Food',
    'Transport',
    'Shopping',
    'Bills',
    'Entertainment',
    'Other',
  ];

  // Fetch all expenses method

  void fetchAllExpenses() {
    // Get the current user's expenses box
    // var userExpenses = getUserBox(userID: _userEmail);
    var userExpenses = Hive.box<Expense>('user_expenses');

    // Convert the Iterable<Expense> to a List<Expense>
    expenses = userExpenses.values.toList();
    // tell the ui that the expenses have been loaded
    emit(ExpensesLoadedSuccessfully(expenses!));
  }

  // Clear all expenses method
  void clearAllExpenses() {
    expenses?.clear();
    // Return an empty list of expenses
    emit(ExpensesLoadedSuccessfully(expenses!));
  }

  // Search for an expense method

  void searchForExpenseByTitle(String title) {
    if (expenses == null) return;
    final query = title.toLowerCase();
    final filteredExpenses = expenses!.where((expense) {
      return expense.title.toLowerCase().contains(query);
    });
    emit(ExpensesLoadedSuccessfully(filteredExpenses.toList()));
  }

  // Filter expenses by category
  void filterExpensesByCategory(String category) {
    if (expenses == null) return;
    final filteredExpenses = expenses!.where((expense) {
      return expense.category!.toLowerCase() == category.toLowerCase();
    });
    emit(ExpensesLoadedSuccessfully(filteredExpenses.toList()));
  }

  // Get the total expenses
  double getTotalExpenses() {
    if (expenses == null) return 0;
    totalExpenses = expenses!.fold(
      0,
      (total, expense) => total + expense.amount,
    );
    return totalExpenses;
  }

  // Get the last expense amount

  double getLastExpenseAmount() {
    if (expenses == null || expenses!.isEmpty) return 0;
    return expenses!.last.amount;
  }

  // Get the total amount for each category

  Map<String, double> getTotalAmountByCategory() {
    if (expenses == null) return {};
    Map<String, double> totalAmountByCategory = {};
    for (var expense in expenses!) {
      if (totalAmountByCategory.containsKey(expense.category)) {
        totalAmountByCategory[expense.category!] =
            totalAmountByCategory[expense.category!]! + expense.amount;
      } else {
        totalAmountByCategory[expense.category!] = expense.amount;
      }
    }
    return totalAmountByCategory;
  }

  // Get the biggest amount of expense

  double getBiggestExpenseAmount() {
    if (expenses == null || expenses!.isEmpty) return 0;
    double biggestAmount = expenses!.first.amount;
    for (var expense in expenses!) {
      if (expense.amount > biggestAmount) {
        biggestAmount = expense.amount;
      }
    }
    return biggestAmount;
  }

  // Get the smallest amount of expense
  double getSmallestExpenseAmount() {
    if (expenses == null || expenses!.isEmpty) return 0;
    double smallestAmount = expenses!.first.amount;
    for (var expense in expenses!) {
      if (expense.amount < smallestAmount) {
        smallestAmount = expense.amount;
      }
    }
    return smallestAmount;
  }

  double getAverageExpenseAmount() {
    if (expenses == null || expenses!.isEmpty) return 0;
    return getTotalExpenses() / expenses!.length;
  }
}
