import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:giatlasv_v2/screens/homepage/home_screen.dart';
import 'package:giatlasv_v2/screens/login/login_screen.dart';
import 'package:go_router/go_router.dart';

class RouteName {
  static const String home = '/home';
  static const String login = '/login';

  static const publicRoutes = [
    login
  ];

  final router = GoRouter(
  redirect: (context, state) {
    if (RouteName.publicRoutes.contains(state.fullPath)) {
      return null;
    }
    // if (context.read<AuthBloc>().state is AuthAuthenticateSuccess) {
    //   return null;
    // }
    return RouteName.login;
  },
  routes: [
    GoRoute(
      path: RouteName.home,
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: RouteName.login,
      builder: (context, state) => const LoginScreen(),
    )
  ],
);
}
