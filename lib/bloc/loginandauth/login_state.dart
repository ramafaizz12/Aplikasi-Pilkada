part of 'login_bloc.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoaded extends LoginState {}

class LoginFailure extends LoginState {
  final String? error;

  LoginFailure({this.error});
}
