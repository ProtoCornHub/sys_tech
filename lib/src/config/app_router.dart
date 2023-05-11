import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../features/user/presentation/view/user_list_screen.dart';



class AppRouter {
  late final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        name: 'user_list',
        pageBuilder: (BuildContext context, GoRouterState state) {
          return customTransitionPage<void>(
            context: context,
            state: state,
            child: const UserListScreen(),
          );
        },
      ),
    ],
    // redirect: (
    //   BuildContext context,
    //   GoRouterState state,
    // ) {
    //   final loginLocation = state.namedLocation('login');
    //   final signupLocation = state.namedLocation('signup');
    //
    //   final bool isLoggedIn =
    //       authBloc.state.status == RemoteAuthStatus.authenticated;
    //
    //   final onLoginScreen = state.subloc == loginLocation;
    //   final onSignupScreen = state.subloc == signupLocation;
    //
    //   if (!isLoggedIn && !onLoginScreen && !onSignupScreen) {
    //     return '/login';
    //   }
    //   if (isLoggedIn && onLoginScreen) {
    //     return '/';
    //   }
    //   if (isLoggedIn && onSignupScreen) {
    //     return '/';
    //   }
    //
    //   return null;
    // },
    // refreshListenable: GoRouterRefreshStream(authBloc.stream),
  );

  CustomTransitionPage customTransitionPage<T>({
    required BuildContext context,
    required GoRouterState state,
    required Widget child,
  }) {
    return CustomTransitionPage<T>(
      key: state.pageKey,
      child: child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        // Change the opacity of the screen using a Curve based on the the animation's
        // value
        return FadeTransition(
          opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
          child: child,
        );
      },
    );
  }
}

class GoRouterRefreshStream extends ChangeNotifier {
  /// Creates a [GoRouterRefreshStream].
  ///
  /// Every time the [stream] receives an event the [GoRouter] will refresh its
  /// current route.
  GoRouterRefreshStream(Stream<dynamic> stream) {
    notifyListeners();
    _subscription = stream.asBroadcastStream().listen(
          (dynamic _) => notifyListeners(),
        );
  }

  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
