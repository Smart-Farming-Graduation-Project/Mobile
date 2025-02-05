import 'package:crop_pilot/featurs/welcome/auth/presentation/views/create_account.dart';
import 'package:crop_pilot/featurs/welcome/auth/presentation/views/account_type.dart';
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
      builder: (context, state) => const AccountType(),
    ),
    GoRoute(
      path: onboarding,
      builder: (context, state) => const CreateAccount(),
    ),
    GoRoute(
      path: login,
      builder: (context, state) => const CreateAccount(),
    ),
    GoRoute(
      path: selectRole,
      builder: (context, state) => const AccountType(),
    ),
    GoRoute(
      path: register,
      builder: (context, state) => const CreateAccount(),
    ),
  ]);
}
