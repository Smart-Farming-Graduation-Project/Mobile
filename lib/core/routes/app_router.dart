import 'package:crop_guard/featurs/cart/views/cart_view.dart';
import 'package:crop_guard/featurs/cart/views/google_map/confirm_delivery_location.dart';
import 'package:crop_guard/featurs/favorite/presentation/views/fav_screen.dart';
import 'package:crop_guard/featurs/home/presentation/views/widgets/home_content.dart';
import 'package:crop_guard/featurs/welcome/auth/presentation/views/main_sign_up.dart';
import 'package:crop_guard/featurs/welcome/auth/presentation/views/reset_password_view.dart';
import 'package:crop_guard/featurs/welcome/auth/presentation/views/sign_in_view.dart';
import 'package:crop_guard/featurs/welcome/auth/presentation/views/otp_code_view.dart';
import 'package:go_router/go_router.dart';
import '../../featurs/categories/presentation/views/category_screen.dart';
import '../../featurs/home/presentation/views/home_page.dart';
import '../../featurs/welcome/onboarding/presentation/views/onboarding_view.dart';
import '../../featurs/welcome/splash/presentation/views/splash_view.dart';

abstract class AppRouter {
  static const String splash = '/';
  static const String onboarding = '/onboarding';
  static const String signIn = '/signIn';
  static const String forgotPassword = '/forgotPassword';
  static const String oTP = '/oTP';
  static const String resetPassword = '/resetPassword';
  static const String signUp = '/signUp';
  static const String home = '/home';
  static const String homeContent = '/homeContent';
  static const String selectRole = '/selectRole';
  static const String cart = '/cart';
  static const String confirmDeliveryLocation = '/confirmDeliveryLocation';
  static const String categoryscreen = '/categoryscreen';
  static const details = '/category-details';
  static const String favorites = '/favorites';

  static final router = GoRouter(routes: [
    // welcome routes
    GoRoute(
      path: splash,
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      path: onboarding,
      builder: (context, state) => const OnboardingView(),
    ),
    // GoRoute(
    //   path: selectRole,
    //   builder: (context, state) => const AccountType(),
    // ),
    GoRoute(
      path: signIn,
      builder: (context, state) => const SignInView(),
    ),
    GoRoute(
      path: oTP,
      builder: (context, state) => const OTPCodeView(),
    ),
    GoRoute(
      path: resetPassword,
      builder: (context, state) => const ResetPasswordView(),
    ),
    GoRoute(
      path: signUp,
      builder: (context, state) => const MainSignUp(),
    ),
    GoRoute(
      path: cart,
      builder: (context, state) => const CartView(),
    ),
    GoRoute(
      path: confirmDeliveryLocation,
      builder: (context, state) => const ConfirmDeliveryLocationView(),
    ),
    GoRoute(
      path: home,
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: homeContent,
      builder: (context, state) => const HomeContent(),
    ),
    GoRoute(
      path: favorites,
      builder: (context, state) => const FavScreen(),
    ),
    GoRoute(
      path: categoryscreen,
      builder: (context, state) => const CategoryScreen(),
    ),
  ]);
}
