import 'dart:developer';

import 'package:expense_tracker/auth/auth_page.dart';
import 'package:expense_tracker/cubits/signup_cubit/signup_states.dart';
import 'package:expense_tracker/cubits/signup_cubit/signup_user_cubit.dart';
import 'package:expense_tracker/helper/auth_snackbar.dart';
import 'package:expense_tracker/helper/helper_dialog.dart';
import 'package:expense_tracker/widgets/my_elevated_buttom.dart';
import 'package:expense_tracker/widgets/my_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final TextEditingController userNameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController confirmPasswordController =
      TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupUserCubit, SignupState>(
      listener: (context, state) async {
        if (state is SignupLoading) {
          loadingIndicator(context, message: 'Signing up...');
        } else if (state is SignupSuccess) {
          Navigator.of(context).pop(); // Close the loading dialog
          // Then navigate to AuthPage
          Navigator.pushNamed(context, AuthPage.authRoute);
          // log('Box opened successfully for user: ${state.user.email}');
        } else if (state is SignupError) {
          Navigator.of(context).pop(); // Close the loading dialog
          showSnackBar(context, state.errorMessage);
        }
      },
      builder: (context, state) {
        return Form(
          key: formKey,
          child: Column(
            children: [
              Text(
                'Sign Up',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 14),
              // Username fiel
              MyTextFormField(
                controller: userNameController,
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Username is required';
                  }
                  return null;
                },
                prefixIcon: Icons.person,
                hintText: 'Enter your username',
              ),
              const SizedBox(height: 16),
              // Email field
              MyTextFormField(
                controller: emailController,
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Email is required';
                  }
                  return null;
                },
                prefixIcon: Icons.email,
                hintText: 'Enter your email',
              ),
              const SizedBox(height: 16),
              // Password field
              MyTextFormField(
                controller: passwordController,
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Password is required';
                  }
                  return null;
                },
                obscureText: true,
                prefixIcon: Icons.lock,
                hintText: 'Enter your password',
              ),
              const SizedBox(height: 16),
              // Confirm password field
              MyTextFormField(
                controller: confirmPasswordController,
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Confirm Password is required';
                  }
                  if (value != passwordController.text) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
                obscureText: true,
                prefixIcon: Icons.lock,
                hintText: 'Confirm your password',
              ),
              const SizedBox(height: 16),
              // Login button
              MyElevatedButtom(
                onPressed: () {
                  // validateUserInput, then Sign Up
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    // Add logic here
                    // Trigger the SignUp Cubit
                    context.read<SignupUserCubit>().signup(
                      context,
                      email: emailController.text,
                      password: passwordController.text,
                    );
                  } else {
                    // Handle validation errors
                  }
                },
                text: 'Sign Up',
              ),
            ],
          ),
        );
      },
    );
  }
}


/*
void validateUserInput(BuildContext context) {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      // Add logic here
      
    } else {
      
    }
  }
*/