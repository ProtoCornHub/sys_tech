import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sys_tech/src/shared/domain/entities/user.dart';

import '../../../../shared/data/models/user_model.dart';
import '../providers/sqlite_provider.dart';

abstract class LocalUserDataSource {
  Future<List<User>> getAllUsers();
  Future<void> addUser(User user);
}

class LocalUserDataSourceImpl implements LocalUserDataSource {
  final dbClient = SqliteProvider.sqliteProvider;

  @override
  Future<List<User>> getAllUsers() async {
    final db = await dbClient.db;
    // the code below is used to query the database
    var result = await db.query("todoTable");
    final users = result.map((user) => UserModel.fromJson(user).toEntity()).toList();
    return users;
  }

  @override
  Future<void> addUser(User user) async {
    final db = await dbClient.db;
    db.insert("userTable", UserModel.fromEntity(user).toJSON()); // here todoTable is the name of
  }
}
