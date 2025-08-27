import 'package:expense_tracker/cubits/add_expense_cubit/add_expense_cubit.dart';
import 'package:expense_tracker/cubits/expenses_cubit/expenses_cubit.dart';
import 'package:expense_tracker/models/expense_model.dart';
import 'package:expense_tracker/widgets/my_elevated_buttom.dart';
import 'package:expense_tracker/widgets/my_text_form_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddExpenseForm extends StatefulWidget {
  const AddExpenseForm({super.key});

  @override
  State<AddExpenseForm> createState() => _AddExpenseFormState();
}

class _AddExpenseFormState extends State<AddExpenseForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _titleController = TextEditingController();

  final TextEditingController _amountController = TextEditingController();

  final TextEditingController _descriptionController = TextEditingController();

  final TextEditingController _categoryController = TextEditingController();

  final TextEditingController _dateController = TextEditingController();
  // To show an error in case of a wrong input
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text('Add Expense', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 16),
            MyTextFormField(
              controller: _titleController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a title';
                }
                return null;
              },
              hintText: 'Enter Title',
            ),
            const SizedBox(height: 16),

            MyTextFormField(
              controller: _amountController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter an amount';
                }
                return null;
              },
              hintText: 'Enter Amount',
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),

            MyTextFormField(
              controller: _descriptionController,
              hintText: 'Enter Description',
              maxLines: 4,
            ),
            const SizedBox(height: 16),

            MyTextFormField(
              controller: _categoryController,
              hintText: 'Enter Category',
            ),
            const SizedBox(height: 16),

            MyTextFormField(
              controller: _dateController,
              hintText: 'Enter Date',
              keyboardType: TextInputType.datetime,
            ),
            const SizedBox(height: 16),

            const SizedBox(height: 16),
            MyElevatedButtom(
              text: 'Add Expense',
              backgroundColor: Theme.of(context).colorScheme.primary,
              onPressed: () {
                // Handle validation and submission
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  // Add logic here
                  // Here we will trigger the cubit
                  context.read<AddExpenseCubit>().addExpense(
                    expense: Expense(
                      userId: FirebaseAuth.instance.currentUser!.email!,
                      title: _titleController.text,
                      amount: double.tryParse(_amountController.text) ?? 0.0,
                      date: DateTime.now().toString(),
                      category: _categoryController.text,
                      description: _descriptionController.text,
                      // expenseID is generated in the cubit
                    ),
                  );
                  // Fetch the expenses again
                  context.read<ExpensesCubit>().fetchAllExpenses();
                } else {
                  autovalidateMode = AutovalidateMode.always;
                  setState(() {
                    
                  });
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class FormText extends StatelessWidget {
  const FormText({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Text(title),
      ),
    );
  }
}
