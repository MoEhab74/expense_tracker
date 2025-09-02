import 'dart:developer';

import 'package:expense_tracker/cubits/add_expense_cubit/add_expense_cubit.dart';
import 'package:expense_tracker/cubits/add_expense_cubit/add_expense_states.dart';
import 'package:expense_tracker/cubits/expenses_cubit/expenses_cubit.dart';
import 'package:expense_tracker/helper/helper_dialog.dart';
import 'package:expense_tracker/widgets/add_expense_form.dart';
import 'package:expense_tracker/helper/helper_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddExpenseBottomSheet extends StatelessWidget {
  const AddExpenseBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    // bloc provider removed
    return BlocConsumer<AddExpenseCubit, AddExpenseState>(
      listener: (context, state) {
        if(state is AddExpenseLoading){
          loadingIndicator(context, message: 'Adding expense...');
        }
        else if(state is AddExpenseSuccess){
          Navigator.of(context).pop(); // Close the loading indicator
          Navigator.of(context).pop(); // Close the bottom sheet
          // fetch expenses to update the ui
          context.read<ExpensesCubit>().fetchAllExpenses();
          showSnackBar(context, 'Expense added successfully');
          // To know from the logs in the debug console (temporary)
          log('Expense added successfully');
        }
        else if(state is AddExpenseError){
          Navigator.of(context).pop(); // Close the loading indicator
          // Show error message
          showDialogBox(context, 'Error occurred: ${state.errorMessage}');
        }
      },
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.only(
            left: 8,
            right: 8,
            // Make the screen of bottom sheet flixable with yhe keyboard
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: SingleChildScrollView(child: const AddExpenseForm()),
        );
      },
    );
  }
}
