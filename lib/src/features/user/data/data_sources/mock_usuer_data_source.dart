import '../../../../shared/data/data_sources/user_data.dart';
import '../../../../shared/data/models/user_model.dart';
import '../../../../shared/domain/entities/user.dart';

abstract class MockUserDataSource {
  Future<List<User>> getAllUsers();
}

class MockUserDataSourceImpl implements MockUserDataSource {
  @override
  Future<List<User>> getAllUsers() async {
    await Future.delayed(const Duration(milliseconds: 300));
    return users
        .map((user) => UserModel.fromJson(user).toEntity())
        .toList();
  }

}