import 'package:crop_guard/core/models/product_model.dart';
import 'package:crop_guard/featurs/community/presentation/views/community_home_screen.dart';
import 'package:crop_guard/featurs/community/presentation/views/create_post.dart';
import 'package:crop_guard/featurs/ecommerce/cart/views/cart_view.dart';
import 'package:crop_guard/featurs/ecommerce/cart/views/google_map/confirm_delivery_location.dart';
import 'package:crop_guard/featurs/ecommerce/categories/presentation/models/category_model.dart';
import 'package:crop_guard/featurs/ecommerce/categories/presentation/views/category_products_screen.dart';
import 'package:crop_guard/featurs/ecommerce/categories/presentation/views/product_detailes_view.dart';
import 'package:crop_guard/featurs/ecommerce/home/presentation/views/widgets/home_content.dart';
import 'package:crop_guard/featurs/ecommerce/notification/views/notification_view.dart';
import 'package:crop_guard/featurs/welcome/auth/presentation/views/main_sign_up.dart';
import 'package:crop_guard/featurs/welcome/auth/presentation/views/reset_password_view.dart';
import 'package:crop_guard/featurs/welcome/auth/presentation/views/sign_in_view.dart';
import 'package:crop_guard/featurs/welcome/auth/presentation/views/otp_code_view.dart';
import 'package:crop_guard/featurs/welcome/splash/presentation/views/widgets/splash_view_body.dart';
import 'package:go_router/go_router.dart';
import '../../featurs/ecommerce/categories/presentation/views/category_screen.dart';
import '../../featurs/ecommerce/home/presentation/views/home_page.dart';
import '../../featurs/welcome/onboarding/presentation/views/onboarding_view.dart';

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
  static const String categoryProducts = '/categoryProducts';
  static const String favorites = '/favorites';
  static const String profile = '/profile';
  static const String notifications = '/notifications';
  static const String settings = '/settings';
  static const String productDetails = '/productDetails';
  static const String review = '/review';
  static const String community = '/commumity';
  static const String createpost = '/createpost';

  static final router = GoRouter(routes: [
    GoRoute(
      path: community,
      builder: (context, state) => const CommunityHomeScreen(),
    ),
    GoRoute(
      path: createpost,
      builder: (context, state) => const CreatePost(),
    ),
    // welcome routes
    GoRoute(
      path: splash,
      builder: (context, state) => const SplashScreen(),
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
    // GoRoute(
    //   path: favorites,
    //   // builder: (context, state) => const FavScreen(),
    // ),
    GoRoute(
      path: categoryscreen,
      builder: (context, state) => const CategoryScreen(),
    ),
    GoRoute(
      path: categoryProducts,
      builder: (context, state) {
        CategoryModel category = state.extra as CategoryModel;
        return CategoryProductsScreen(category: category);
      },
    ),
    GoRoute(
      path: productDetails,
      builder: (context, state) {
        final product = state.extra as ProductModel;
        return ProductDetailsView(product: product);
      },
    ),
    GoRoute(
      path: notifications,
      builder: (context, state) => const NotificationView(),
    ),
  ]);
}
