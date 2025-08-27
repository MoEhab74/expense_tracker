import 'package:expense_tracker/models/expense_model.dart';

class ExpensesState{}

class ExpensesInitial extends ExpensesState{}

class ExpensesLoadedSuccessfully extends ExpensesState{
  final List<Expense> expenses;

  ExpensesLoadedSuccessfully(this.expenses);
}

class ExpensesError extends ExpensesState{
  final String message;

  ExpensesError(this.message);
}