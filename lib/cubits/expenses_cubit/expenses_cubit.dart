import 'package:expense_tracker/cubits/expenses_cubit/expenses_states.dart';
import 'package:expense_tracker/models/expense_model.dart';
import 'package:expense_tracker/services/open_user_box.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExpensesCubit extends Cubit<ExpensesState> {
  ExpensesCubit() : super(ExpensesInitial());

  List<Expense>? _expenses ;
  final String _userID = FirebaseAuth.instance.currentUser!.uid;

  // Fetch all expenses method 

  void fetchAllExpenses() {
    // Get the current user's expenses box
    var userExpenses = getUserBox(userId: _userID);
    // Convert the Iterable<Expense> to a List<Expense>
    _expenses = userExpenses.values.toList();
    // tell the ui that the expenses have been loaded
    emit(ExpensesLoadedSuccessfully(_expenses!));
  }

  // Clear all expenses method
  void clearAllExpenses() {
    _expenses?.clear();
    // Return an empty list of expenses
    emit(ExpensesLoadedSuccessfully([]));
  }

  // Search for an expense method


  void searchForExpenseByTitle(String title){
    if(_expenses == null) return;
    final query = title.toLowerCase();
    final filteredExpenses = _expenses!.where((expense){
      return expense.title.toLowerCase().contains(query);
    });
    emit(ExpensesLoadedSuccessfully(filteredExpenses.toList()));
  }


}