part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();
}

class UserGetUsers extends UserEvent {
  @override
  List<Object?> get props => [];
}