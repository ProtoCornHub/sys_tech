part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  const UserState();
}

class UserLoading extends UserState {
  @override
  List<Object> get props => [];
}

class UserLoaded extends UserState {
  final List<User> users;

  const UserLoaded({this.users = const <User>[]});
  @override
  List<Object> get props => [users];
}


class UserFailure extends UserState {
  final String message;

  const UserFailure({required this.message});
  @override
  List<Object> get props => [message];
}
