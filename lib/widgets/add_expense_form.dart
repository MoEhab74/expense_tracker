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

  String? _title, _amount, _description, _category, _date;
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
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a title';
                }
                return null;
              },
              hintText: 'Enter Title',
              onSaved: (value) {
                _title = value;
              },
            ),
            const SizedBox(height: 16),

            MyTextFormField(
              onSaved: (value) {
                _amount = value;
              },
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
                hintText: 'Enter Description',
              maxLines: 4,
              onSaved: (value) {
                _description = value;
              },
            ),
            const SizedBox(height: 16),

            MyTextFormField(
              hintText: 'Enter Category',
              onSaved: (value) {
                _category = value;
              },
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
                  BlocProvider.of<AddExpenseCubit>(context).addExpense(
                    expense: Expense(
                      // userID is FirebaseAuth.instance.currentUser!.email!
                      userId: FirebaseAuth.instance.currentUser!.email!,
                      title: _title!,
                      amount: double.tryParse(_amount ?? '') ?? 0.0,
                      date: DateTime.now().toString(),
                      category: _category ?? 'Nothing',
                      description: _description ?? 'No Description',
                      // expenseID is generated in the cubit
                    ),
                  );
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
