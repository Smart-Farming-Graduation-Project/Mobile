import 'package:crop_pilot/featurs/welcome/auth/presentation/views/login_view.dart';
import 'package:crop_pilot/featurs/welcome/splash/presentation/views/splash_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const String splash = '/';
  static const String onboarding = '/onboarding';
  static const String login = '/login';
  static const String register = '/register';
  static const String home = '/home';
  static const String selectRole = '/selectRole';
  static final router = GoRouter(routes: [
    GoRoute(
      path: splash,
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      path: onboarding,
      builder: (context, state) => const LoginView(),
    ),
    GoRoute(
      path: login,
      builder: (context, state) => const LoginView(),
    ),
    GoRoute(
      path: register,
      builder: (context, state) => const LoginView(),
    ),
  ]);
}
