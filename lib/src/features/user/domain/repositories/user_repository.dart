import 'package:sys_tech/src/shared/domain/entities/user.dart';

abstract class UserRepository {
  Future<List<User>> getAllUsers();
}