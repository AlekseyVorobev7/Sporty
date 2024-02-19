part of 'user_bloc.dart';

@immutable
abstract class UserEvent {}

class UserLogInEvent extends UserEvent {
  final String email;
  final String password;

  UserLogInEvent(this.email, this.password);
}

class UserRegisterEvent extends UserEvent {
  final String first_name;
  final String second_name;
  final String email;
  final String password;

  UserRegisterEvent(
      this.first_name, this.second_name, this.email, this.password);
}
