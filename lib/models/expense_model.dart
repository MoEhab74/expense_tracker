import 'package:hive/hive.dart';

part 'expense_model.g.dart';

@HiveType(typeId: 0)
class Expense {
  @HiveField(0)
  final String userId;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final double amount;

  @HiveField(3)
  final String date;

  @HiveField(4)
  final String category;

  @HiveField(5)
  final String description;

  @HiveField(6)
  final String? expenseID;

  Expense({
    required this.userId,
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
    required this.description,
    this.expenseID,
  });
}
