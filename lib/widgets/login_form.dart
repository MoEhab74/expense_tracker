import 'package:expense_tracker/auth/auth_page.dart';
import 'package:expense_tracker/auth/signup_page.dart';
import 'package:expense_tracker/cubits/login_cubit/login_states.dart';
import 'package:expense_tracker/cubits/login_cubit/login_user_cubit.dart';
import 'package:expense_tracker/helper/helper_dialog.dart';
import 'package:expense_tracker/helper/helper_snackbar.dart';
import 'package:expense_tracker/widgets/login_or_signup_hint.dart';
import 'package:expense_tracker/widgets/my_elevated_buttom.dart';
import 'package:expense_tracker/widgets/my_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool isAsyncCall = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginUserCubit, LoginState>(
      listener: (context, state) async{
        if (state is LoginLoading) {
          loadingIndicator(context, message: 'Logging in...');
        }
        if (state is LoginSuccess)  {
          Navigator.pop(context); // Close the loading dialog
          // Open user box first
          // Then navigate to AuthPage
          Navigator.pushNamed(context, AuthPage.authRoute);
          // log('Box opened successfully for user: ${state.user.email}');
        }
        if (state is LoginError) {
          Navigator.pop(context); // Close the loading dialog
          showSnackBar(
            context,
            state.errorMessage ?? 'Login failed, please try again.',
          );
        }
      },
      builder: (context, state) {
        return Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 16),
                  Text(
                    'Login',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 40),
                  // Email field
                  MyTextFormField(
                    controller: emailController,
                    validator: (value) {
                      // Validate email ===> value == null || value.isEmpty
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
                      // Validate password ===> value == null || value.isEmpty
                      if (value?.isEmpty ?? true) {
                        return 'Password is required';
                      }
                      return null;
                    },
                    obscureText: true,
                    prefixIcon: Icons.lock,
                    hintText: 'Enter your password',
                  ),
                  const SizedBox(height: 24),
                  // Login button
                  MyElevatedButtom(
                    onPressed: () async {
                      // validate User Input, then Navigate to HomeView
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        // Add logic here  ===> here we will trigger the cubit

                        context.read<LoginUserCubit>().login(
                          context,
                          email: emailController.text,
                          password: passwordController.text,
                        );
                      } else {
                        // Handle validation errors
                        showSnackBar(
                          context,
                          'An error occurred. Please try again.',
                        );
                      }
                    },
                    text: 'Login',
                  ),
                  const SizedBox(height: 14),
                  // Register button
                  LoginOrSignupHint(
                    haveAccountOrNot: 'Don\'t have an account?',
                    loginOrSignup: 'Sign Up',
                    onPressed: () {
                      Navigator.pushNamed(context, SignUpPage.signupRoute);
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  

}
