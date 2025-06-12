import 'package:app/presentation/auth/login_screen.dart';
import 'package:app/presentation/auth/otp_screen.dart';
import 'package:app/presentation/auth/sign_up_screen.dart';
import 'package:app/presentation/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:app/presentation/main_screen/main_screen.dart';
import 'package:app/router/router_path.dart';
import 'package:app/router/transitions.dart';

class AppRouter {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final _shellNavigatorKey = GlobalKey<NavigatorState>();

  static GoRouter get router => _router;

  static final GoRouter _router = GoRouter(
    initialLocation: ScreenPath.splash,
    redirect: _handleRedirect,
    redirectLimit: 10,
    navigatorKey: _rootNavigatorKey,
    routes: [
      /// Splash Screen
      GoRoute(
        path: ScreenPath.splash,
        parentNavigatorKey: _rootNavigatorKey,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            child: Container(),
            transitionsBuilder: useNavChangeTransition,
          );
        },
      ),

      /// Home
      GoRoute(
        path: ScreenPath.login,
        parentNavigatorKey: _rootNavigatorKey,
        pageBuilder: (context, state) {
          return const CustomTransitionPage(
            child: ScreenLogin(),
            transitionsBuilder: useNavChangeTransition,
          );
        },
        routes: [
          GoRoute(
            path: 'phone',
            parentNavigatorKey: _rootNavigatorKey,
            pageBuilder: (context, state) {
              return CustomTransitionPage(
                child: ScreenSignup(),
                transitionsBuilder: useNavChangeTransition,
              );
            },
          ),
          GoRoute(
            path: 'otp',
            parentNavigatorKey: _rootNavigatorKey,
            pageBuilder: (context, state) {
              return CustomTransitionPage(
                child: OtpScreen(
                  phone: state.uri.queryParameters['phn'] ?? '+91',
                ),
                transitionsBuilder: useNavChangeTransition,
              );
            },
          ),
        ],
      ),

      ///Navigation shell
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) {
          return ScreenMain(
            key: state.pageKey,
            child: child,
          );
        },
        routes: [
          GoRoute(
            path: ScreenPath.home,
            parentNavigatorKey: _shellNavigatorKey,
            pageBuilder: (context, state) {
              return CustomTransitionPage(
                child: HomeScreen(),
                transitionsBuilder: useNavChangeTransition,
              );
            },
          ),

          /// Profile
        ],
      ),
    ],
  );
}

String? _initialDeepLink;
String? get initialDeepLink => _initialDeepLink;

String? _handleRedirect(BuildContext context, GoRouterState state) {
  return null;
}
