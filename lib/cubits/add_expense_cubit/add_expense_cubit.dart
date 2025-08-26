import 'package:expense_tracker/cubits/add_expense_cubit/add_expense_states.dart';
import 'package:expense_tracker/models/expense_model.dart';
import 'package:expense_tracker/services/open_user_box.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddExpenseCubit extends Cubit<AddExpenseState> {
  AddExpenseCubit() : super(AddExpenseInitial());

  // create addExpense function

  void addExpense({required Expense expense}) async{
    emit(AddExpenseLoading(userId: expense.userId, expense: expense));

    try {
      // Store the Expense in your local database ===> in the box that you created
      var userExpensesBox = getUserBox(userId: expense.userId);
      await userExpensesBox.add(expense);
      emit(AddExpenseSuccess(userId: expense.userId, expense: expense));
    } catch (e) {
      // If there's an error, emit error state with the error message
      emit(AddExpenseError(
        userId: expense.userId,
        expense: expense,
        errorMessage: e.toString(),
      ));
    }

  }

  
}

