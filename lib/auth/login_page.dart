import 'package:expense_tracker/cubits/login_cubit/login_user_cubit.dart';
import 'package:expense_tracker/widgets/login_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  static const String loginRoute = 'LoginPage';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginUserCubit(),
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
          child: LoginForm(),
        ),
      ),
    );
  }
}
