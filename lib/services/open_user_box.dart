import 'package:expense_tracker/models/expense_model.dart';
import 'package:hive/hive.dart';

Future<Box<Expense>> openUserBox({required String userId}) async {
  // Open the user expenses box
  return await Hive.openBox<Expense>('user_expenses_$userId');
}
