import 'package:firebase_auth/firebase_auth.dart';

class SignupState {}

class SignupInitial extends SignupState {}

class SignupLoading extends SignupState {}

class SignupSuccess extends SignupState {
  final User user;

  SignupSuccess({required this.user});
}

class SignupError extends SignupState {
  final String errorMessage;

  SignupError({required this.errorMessage});
}