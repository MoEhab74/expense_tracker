import 'package:expense_tracker/auth/auth_page.dart';
import 'package:expense_tracker/auth/login_page.dart';
import 'package:expense_tracker/widgets/login_or_signup_hint.dart';
import 'package:expense_tracker/widgets/simple_outlined_buttom.dart';
import 'package:flutter/material.dart';

class OnBoarding2 extends StatelessWidget {
  const OnBoarding2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 120),
            Text(
              'Spend Smarter\nSave More',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSecondary,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 250),

            SimpleOutlinedButtom(
              text: 'Let\'s Get Started',
              onPressed: () {
                Navigator.pushNamed(context, AuthPage.authRoute);
              },
            ),

            SizedBox(height: 16),
            LoginOrSignupHint(
              haveAccountOrNot: 'Already have an account?',
              loginOrSignup: 'Login',
              onPressed: () {
                Navigator.pushNamed(context, LoginPage.loginRoute);
              },
            ),
          ],
        ),
      ),
    );
  }
}
