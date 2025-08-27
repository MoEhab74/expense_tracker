import 'package:expense_tracker/cubits/login_cubit/login_states.dart';
import 'package:expense_tracker/helper/auth_snackbar.dart';
import 'package:expense_tracker/services/open_user_box.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginUserCubit extends Cubit<LoginState> {
  // Cubit is just for the business logic and any action needed after performing the cubit function
  // will be handled according to the state emitted by the cubit.

  LoginUserCubit() : super(LoginInitial());

  // Login method

  Future<void> login(
    BuildContext context, {
    required String email,
    required String password,
  }) async {
    emit(LoginLoading());
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // await openBox(state)
      await openUserBox(userID: credential.user!.email!);
      // Navigator.pushNamed(context, HomeView.homeRoute);
      emit(LoginSuccess(user: credential.user!));
      showSnackBar(
        context,
        'User logged in successfully, signed in as: ${credential.user!.email}',
      );
      // Navigate to HomeView
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showSnackBar(context, 'No user found for that email.');
      } else if (e.code == 'invalid-email') {
        showSnackBar(context, 'Invalid email address.');
      } else if (e.code == 'wrong-password') {
        showSnackBar(context, 'Wrong password provided for that user.');
      } else if (e.code == 'INVALID_LOGIN_CREDENTIALS' ||
          e.code == 'invalid-credential') {
        showSnackBar(context, 'Invalid login credentials provided.');
      }
      emit(LoginError(errorMessage: e.message));
    }
  }
}
