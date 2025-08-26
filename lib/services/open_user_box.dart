import 'package:expense_tracker/models/expense_model.dart';
import 'package:hive/hive.dart';

  // Open the user expenses box
Future<Box<Expense>> openUserBox({required String userId}) async {
  return await Hive.openBox<Expense>('user_expenses_$userId');
}

// get the box of the current user
Box<Expense> getUserBox({required String userId}) {
  return Hive.box<Expense>('user_expenses_$userId');
}
