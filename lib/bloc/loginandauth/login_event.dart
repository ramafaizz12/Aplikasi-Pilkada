part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class LoginButton extends LoginEvent {
  final String? email;
  final String? password;

  LoginButton({required this.email, required this.password});
}
