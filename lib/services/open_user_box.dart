import 'package:expense_tracker/models/expense_model.dart';
import 'package:hive/hive.dart';

  // Open the user expenses box
Future<Box<Expense>> openUserBox({required String email}) async {
  return await Hive.openBox<Expense>('user_expenses_$email');
}

// get the box of the current user
Box<Expense> getUserBox({required String email}) {
  return Hive.box<Expense>('user_expenses_$email');
}
