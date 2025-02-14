import 'package:crop_guard/featurs/cart/views/cart_view.dart';
import 'package:crop_guard/featurs/welcome/auth/presentation/views/account_type.dart';
import 'package:crop_guard/featurs/welcome/auth/presentation/views/create_account.dart';
import 'package:crop_guard/featurs/welcome/auth/presentation/views/sign_in.dart';
import 'package:go_router/go_router.dart';
import '../../../featurs/categories/presentation/views/category_screen.dart';
import '../../../featurs/home/presentation/views/home_page.dart';
import '../../../featurs/welcome/onboarding/presentation/views/onboarding_view.dart';
import '../../../featurs/welcome/splash/presentation/views/splash_view.dart';

abstract class AppRouter {
  static const String splash = '/';
  static const String onboarding = '/onboarding';
  static const String login = '/login';
  static const String register = '/register';
  static const String home = '/home';
  static const String selectRole = '/selectRole';
  static const String cart = '/cart';
  static const String categoryscreen = '/categoryscreen';
  static const details = '/category-details';


  static final router = GoRouter(initialLocation: splash, routes: [
    // welcome routes
    GoRoute(
      path: splash,
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      path: onboarding,
      builder: (context, state) => const OnboardingView(),
    ),
    GoRoute(
      path: selectRole,
      builder: (context, state) => const AccountType(),
    ),
    GoRoute(
      path: login,
      builder: (context, state) => const SignIn(),
    ),
    GoRoute(
      path: register,
      builder: (context, state) => const CreateAccount(),
    ),
    GoRoute(
      path: cart,
      builder: (context, state) => const CartView(),
    ),
    GoRoute(
      path: home,
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: categoryscreen,
      builder: (context, state) => const CategoryScreen(),
    ),
  
  ]);
}
