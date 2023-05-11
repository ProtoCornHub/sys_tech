import 'package:sys_tech/src/features/user/domain/repositories/user_repository.dart';
import 'package:sys_tech/src/shared/domain/use_cases/use_cases.dart';

import '../../../../shared/domain/entities/user.dart';

class GetAllUsers implements UseCase<List<User>, NoParams> {
  final UserRepository userRepository;

  GetAllUsers(this.userRepository);
  @override
  Future<List<User>> call(NoParams params) {
   return userRepository.getAllUsers();
  }

}