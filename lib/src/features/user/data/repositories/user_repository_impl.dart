import 'package:sys_tech/src/features/user/domain/repositories/user_repository.dart';
import 'package:sys_tech/src/shared/domain/entities/user.dart';

import '../data_sources/local_user_data_source.dart';
import '../data_sources/mock_usuer_data_source.dart';

class UserRepositoryImpl extends UserRepository {
  final LocalUserDataSource localUserDataSource;
  final MockUserDataSource mockUserDataSource;

  UserRepositoryImpl(this.localUserDataSource, this.mockUserDataSource);
  @override
  Future<List<User>> getAllUsers() async {
    if ((await localUserDataSource.getAllUsers()).isEmpty) {
      List<User> users = await mockUserDataSource.getAllUsers();
      for (final user in users) {
        localUserDataSource.addUser(user);
      }
      return users;
    }
    return localUserDataSource.getAllUsers();
  }
}