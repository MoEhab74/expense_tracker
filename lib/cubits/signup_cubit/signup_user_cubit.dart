import 'package:expense_tracker/cubits/signup_cubit/signup_states.dart';
import 'package:expense_tracker/helper/helper_snackbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupUserCubit extends Cubit<SignupState> {
  SignupUserCubit() : super(SignupInitial());

  Future<void> signup(BuildContext context, {required String email, required String password}) async {
    emit(SignupLoading());
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
          // Open user box first
          // await openUserBox(userID: credential.user!.email!);
      emit(SignupSuccess(user: credential.user!));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        showSnackBar(context,'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        showSnackBar(context,'The account already exists for that email.');
      } else if (e.code == 'invalid-email') {
        showSnackBar(context,'The email address is not valid.');
      } else if (e.code == 'network-request-failed') {
        showSnackBar(context,'Network request failed. Please try again later.');
      }
      emit(SignupError(errorMessage: e.message!));
    }
  }
}
