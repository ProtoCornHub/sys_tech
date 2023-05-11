import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sys_tech/src/shared/domain/use_cases/use_cases.dart';

import '../../../../../shared/domain/entities/user.dart';
import '../../../domain/use_cases/get_all_users.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final GetAllUsers _getAllUsers;
  UserBloc({
    required GetAllUsers getAllUsers,
}) : _getAllUsers = getAllUsers,
        super(UserLoading()) {
    on<UserGetUsers>(_onUserGetUsers);
  }

  void _onUserGetUsers(UserGetUsers event, Emitter<UserState> emit) async {
    debugPrint('Getting all users with _onUserGetUsers...');
    try {
      final users = await _getAllUsers(NoParams());
      debugPrint('Got users= ${users.length}');
      emit(UserLoaded(users: users));
    } catch (error, stackTrace) {
      debugPrintStack(
        label: error.toString(),
        stackTrace: stackTrace,
      );
      emit(UserFailure(message: error.toString()));
    }
  }
}
