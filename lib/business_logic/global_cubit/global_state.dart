part of 'global_cubit.dart';

@immutable
abstract class GlobalState {}

class GlobalInitial extends GlobalState {}

class ChangePasswordVisibilityState extends GlobalState {}

class LoginLoadingState extends GlobalState {}

class LoginErrorState extends GlobalState {
  final String error;
  LoginErrorState(this.error);
}

class LoginSucessState extends GlobalState {}

class RegistrationLoadingState extends GlobalState {}

class RegistrationErrorState extends GlobalState {}

class RegistrationSucessState extends GlobalState {
  String message;
  RegistrationSucessState(this.message);
}
