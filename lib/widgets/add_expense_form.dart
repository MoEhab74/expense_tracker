import 'package:expense_tracker/widgets/my_elevated_buttom.dart';
import 'package:expense_tracker/widgets/my_text_form_field.dart';
import 'package:flutter/material.dart';

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
                } else {
                  // Show error message
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
