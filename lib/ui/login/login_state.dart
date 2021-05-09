part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class Default extends LoginState {}

class Loading extends LoginState {}

class LoggedIn extends LoginState {}

class LoginFailed extends LoginState {}
