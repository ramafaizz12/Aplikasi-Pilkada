part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthAuthenticated extends AuthState {}

class AuthUthenticated extends AuthState {}

class AuthLoading extends AuthState {}
