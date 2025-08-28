import 'package:expense_tracker/cubits/expenses_cubit/expenses_states.dart';
import 'package:expense_tracker/models/expense_model.dart';
import 'package:expense_tracker/services/open_user_box.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

class ExpensesCubit extends Cubit<ExpensesState> {
  ExpensesCubit() : super(ExpensesInitial());

  List<Expense>? expenses;
  // final String _userEmail = FirebaseAuth.instance.currentUser!.email!;

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
    emit(ExpensesLoadedSuccessfully([]));
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
}
