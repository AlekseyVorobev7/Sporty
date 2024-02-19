part of 'user_bloc.dart';

@immutable
abstract class UserState {}

class UserInitial extends UserState {}

// ignore: must_be_immutable
class UserLoadedState extends UserState {
  MyUser user;

  UserLoadedState(this.user);
}

class UserLoadingState extends UserState {}

class UserLoadingError extends UserState {}
