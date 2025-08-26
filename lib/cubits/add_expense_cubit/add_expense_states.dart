import 'package:expense_tracker/models/expense_model.dart';

class AddExpenseState {
  final String userId;
  final Expense expense;

  AddExpenseState({required this.userId, required this.expense});
}

class AddExpenseInitial extends AddExpenseState {
  AddExpenseInitial()
    : super(
        userId: '',
        expense: Expense(
          userId: '',
          title: '',
          amount: 0.0,
          date: '',
          category: '',
          description: '',
        ),
      );
}

class AddExpenseLoading extends AddExpenseState {
  AddExpenseLoading({required super.userId, required super.expense});
}

class AddExpenseSuccess extends AddExpenseState {
  AddExpenseSuccess({required super.userId, required super.expense});
}

class AddExpenseError extends AddExpenseState {
  final String errorMessage;

  AddExpenseError({
    required super.userId,
    required super.expense,
    required this.errorMessage,
  });
}
