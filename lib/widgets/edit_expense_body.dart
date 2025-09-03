import 'package:expense_tracker/cubits/expenses_cubit/expenses_cubit.dart';
import 'package:expense_tracker/helper/helper_snackbar.dart';
import 'package:expense_tracker/models/expense_model.dart';
import 'package:expense_tracker/widgets/action_outlined_buttom.dart';
import 'package:expense_tracker/widgets/my_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditExpenseBody extends StatefulWidget {
  const EditExpenseBody({super.key, required this.expense});
  final Expense expense;

  @override
  State<EditExpenseBody> createState() => _EditExpenseBodyState();
}

class _EditExpenseBodyState extends State<EditExpenseBody> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();

  @override
void initState() {
  super.initState();
  _titleController.text = widget.expense.title;
  _amountController.text = widget.expense.amount.toString();
  _descriptionController.text = widget.expense.description ?? '';
  _categoryController.text = widget.expense.category ?? '';
}

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
        child: Column(
          children: [
            MyTextFormField(
              controller: _titleController,
              hintText: 'Update title',
            ),
            const SizedBox(height: 16),
      
            MyTextFormField(
              controller: _amountController,
              hintText: 'Update amount',
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
      
            MyTextFormField(
              controller: _descriptionController,
              hintText: 'Update description',
              maxLines: 4,
            ),
            const SizedBox(height: 16),
      
            MyTextFormField(
              controller: _categoryController,
              hintText: 'Update category',
            ),
            const SizedBox(height: 24),
            ActionOutlinedButtom(
              text: 'Save',
              onPressed: () {
                // Edit expense logic
                editExpenseLogic(context);
                showSnackBar(context, 'Expense edited successfully');
              },
            ),
          ],
        ),
      ),
    );
  }

  void editExpenseLogic(BuildContext context) {
    widget.expense.title = _titleController.text.isEmpty
        ? widget.expense.title
        : _titleController.text;

    widget.expense.amount = _amountController.text.isEmpty
        ? widget.expense.amount
        : double.parse(_amountController.text);

    widget.expense.description = _descriptionController.text.isEmpty
        ? widget.expense.description
        : _descriptionController.text;

    widget.expense.category = _categoryController.text.isEmpty
        ? widget.expense.category
        : _categoryController.text;

    // Update the expense ===> save provided by hive
    widget.expense.save();

    // Refresh the UI by fetching all expenses after updating the expense
    BlocProvider.of<ExpensesCubit>(context).fetchAllExpenses();
    Navigator.pop(context);
  }
}
