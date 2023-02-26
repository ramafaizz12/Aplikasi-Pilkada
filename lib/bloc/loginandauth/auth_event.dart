part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class AppStarted extends AuthEvent {}

class Loggedin extends AuthEvent {
  final String token;

  Loggedin({required this.token});
}

class LoggedOut extends AuthEvent {}
