import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sys_tech/src/features/user/data/data_sources/mock_usuer_data_source.dart';

import 'src/config/app_router.dart';
import 'src/features/user/data/data_sources/local_user_data_source.dart';
import 'src/features/user/data/repositories/user_repository_impl.dart';
import 'src/features/user/domain/use_cases/get_all_users.dart';
import 'src/features/user/presentation/blocs/user/user_bloc.dart';

void main() {
  // Avoid errors caused by flutter upgrade.
// Importing 'package:flutter/widgets.dart' is required.
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => UserRepositoryImpl(
            LocalUserDataSourceImpl(),
            MockUserDataSourceImpl(),
          ),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => UserBloc(
              getAllUsers: GetAllUsers(
                context.read<UserRepositoryImpl>(),
              ),
            ),
          ),
        ],
        child: Builder(
          builder: (context) {
            return MaterialApp.router(
              title: 'SysTech',
              routerConfig: AppRouter().router,
            );
          }
        ),
      ),
    );
  }
}

