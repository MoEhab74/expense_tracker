import 'package:firebase_auth/firebase_auth.dart';

class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final User user;

  LoginSuccess({required this.user});
}

class LoginError extends LoginState {
  final String? errorMessage;

  LoginError({this.errorMessage});
}
