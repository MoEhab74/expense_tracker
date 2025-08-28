import 'package:expense_tracker/cubits/add_expense_cubit/add_expense_states.dart';
import 'package:expense_tracker/models/expense_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

class AddExpenseCubit extends Cubit<AddExpenseState> {
  AddExpenseCubit() : super(AddExpenseInitial());
  
  // create addExpense function

  void addExpense({required Expense expense}) async {
    try {
      // userId ===> email
      // Store the Expense in your local database ===> in the box that you created
      var userExpensesBox = Hive.box<Expense>('user_expenses');
      // Create a unique ID for the new expense
      final counter = userExpensesBox.length + 1;
      final expenseId = 'EXP$counter';
      // Create a new Expense that you want to add
      final newExpense = Expense(
        userId: expense.userId,
        title: expense.title,
        amount: expense.amount,
        date: expense.date,
        category: expense.category,
        description: expense.description,
        // Every expense you will create will have a unique ID
        expenseID: expenseId,
      );
      emit(AddExpenseLoading(userId: expense.userId, expense: newExpense));

      await userExpensesBox.put(expenseId, newExpense);
      emit(AddExpenseSuccess(userId: expense.userId, expense: newExpense));
    } catch (e) {
      // If there's an error, emit error state with the error message
      emit(
        AddExpenseError(
          userId: expense.userId,
          expense: expense,
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
