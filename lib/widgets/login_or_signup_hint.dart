import 'package:flutter/material.dart';

class LoginOrSignupHint extends StatelessWidget {
  const LoginOrSignupHint({
    super.key,
    required this.haveAccountOrNot,
    required this.loginOrSignup,
    this.onPressed,
  });

  final String haveAccountOrNot;
  final String loginOrSignup;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          haveAccountOrNot,
          style: TextStyle(color: Theme.of(context).colorScheme.onSecondary),
        ),
        TextButton(
          onPressed: onPressed ?? () {},
          child: Text(
            loginOrSignup,
            style: TextStyle(
              color: Theme.of(context).colorScheme.onSecondary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
