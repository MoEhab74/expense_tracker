import 'package:expense_tracker/cubits/signup_cubit/signup_user_cubit.dart';
import 'package:expense_tracker/widgets/signup_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  static const String signupRoute = 'SignUpPage';

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupUserCubit(),
      child: Scaffold(
        appBar: AppBar(backgroundColor: Theme.of(context).colorScheme.primary),
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        body: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(62),
              bottomRight: Radius.circular(62),
            ),
            color: Theme.of(context).colorScheme.primary,
          ),
          width: double.infinity,
          height: 550,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                left: 16,
                right: 16,
                top: 16,
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: SignUpForm(),
            ),
          ),
        ),
      ),
    );
  }
}
