import 'dart:io';

import 'package:crop_guard/core/models/product_model.dart';
import 'package:crop_guard/features/ecommerce/cart/data/models/cart_product_model.dart';
import 'package:crop_guard/features/ecommerce/cart/presentation/views/cart_view.dart';
import 'package:crop_guard/features/ecommerce/categories/data/models/category_model.dart';
import 'package:crop_guard/features/ecommerce/categories/presentation/views/category_view.dart';
import 'package:crop_guard/features/ecommerce/categories/presentation/views/category_section.dart';
import 'package:crop_guard/features/ecommerce/categories/presentation/views/category_products_screen.dart';
import 'package:crop_guard/features/ecommerce/categories/presentation/views/product_detailes_view.dart';
import 'package:crop_guard/features/ecommerce/google_map/models/checkout_data.dart';
import 'package:crop_guard/features/ecommerce/google_map/presentation/views/confirm_delivery_location.dart';
import 'package:crop_guard/features/ecommerce/home/presentation/views/home_page.dart';
import 'package:crop_guard/features/ecommerce/home/presentation/widgets/home_content.dart';
import 'package:crop_guard/features/ecommerce/notification/presentation/views/notification_view.dart';
import 'package:crop_guard/features/ecommerce/payment/presentation/views/payment_view.dart';
import 'package:crop_guard/features/ecommerce/popular_products/presentation/views/popular_products_view.dart';
import 'package:crop_guard/features/ecommerce/profile/presentation/manger/cubits/cubit/edit_profile_cubit_dart_cubit.dart';
import 'package:crop_guard/features/ecommerce/profile/presentation/views/edit_profile.dart';
import 'package:crop_guard/features/ecommerce/profile/presentation/views/profile_view.dart';
import 'package:crop_guard/features/ecommerce/reviews/presentation/views/reviews_screen.dart';
import 'package:crop_guard/features/farmer/add_products/presentation/views/add_products_view.dart';
import 'package:crop_guard/features/farmer/add_products/presentation/cubits/add_product_cubit.dart';
import 'package:crop_guard/features/farmer/chat_bot/presentation/views/chat_bot_view.dart';
import 'package:crop_guard/features/farmer/community/presentation/cubits/create_post_cubit.dart';
import 'package:crop_guard/features/farmer/community/presentation/views/community_home_screen.dart';
import 'package:crop_guard/features/farmer/community/presentation/views/create_post.dart';
import 'package:crop_guard/features/farmer/home/presentation/views/farmer_home.dart';
import 'package:crop_guard/features/farmer/market/presentation/views/market_view.dart';
import 'package:crop_guard/features/farmer/my_products/domain/entities/my_product_entity.dart';
import 'package:crop_guard/features/farmer/my_products/presentation/cubits/my_products_cubit.dart';
import 'package:crop_guard/features/farmer/my_products/presentation/views/my_products_view.dart';
import 'package:crop_guard/features/farmer/pest_detection/presentation/views/pest_detection_view.dart';
import 'package:crop_guard/features/farmer/rover_control/presentation/views/rover_control_view.dart';
import 'package:crop_guard/features/farmer/rover_control/presentation/widgets/connection_screen.dart';
import 'package:crop_guard/features/farmer/rover_control/presentation/widgets/control_screen.dart';
import 'package:crop_guard/features/farmer/soil_info/presentation/views/soil_info_view.dart';
import 'package:crop_guard/features/farmer/update_products/presentation/cubits/update_product_cubit.dart';
import 'package:crop_guard/features/farmer/update_products/presentation/views/update_products_view.dart';
import 'package:crop_guard/features/welcome/auth/presentation/views/main_sign_up.dart';
import 'package:crop_guard/features/welcome/auth/presentation/views/otp_code_view.dart';
import 'package:crop_guard/features/welcome/auth/presentation/views/reset_password_view.dart';
import 'package:crop_guard/features/welcome/auth/presentation/views/sign_in_view.dart';
import 'package:crop_guard/features/welcome/onboarding/presentation/views/onboarding_view.dart';
import 'package:crop_guard/features/welcome/splash/presentation/views/widgets/splash_view_body.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:crop_guard/core/services/service_locator.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const String splash = '/';
  static const String onboarding = '/onboarding';
  static const String signIn = '/signIn';
  static const String forgotPassword = '/forgotPassword';
  static const String oTP = '/oTP';
  static const String resetPassword = '/resetPassword';
  static const String signUp = '/signUp';
  static const String buyerHome = '/buyerHome';
  static const String homeContent = '/homeContent';
  static const String selectRole = '/selectRole';
  static const String cart = '/cart';
  static const String payment = '/payment';
  static const String confirmDeliveryLocation = '/confirmDeliveryLocation';
  static const String category = '/category';
  static const String categoryscreen = '/categoryscreen';
  static const String categoryProducts = '/categoryProducts';
  static const String favorites = '/favorites';
  static const String popularProducts = '/popularProducts';
  static const String profile = '/profile';
  static const String notifications = '/notifications';
  static const String settings = '/settings';
  static const String productDetails = '/productDetails';
  static const String review = '/review';
  //farmer routes
  static const String farmerHome = '/farmerHome';
  static const String farmerMarket = '/farmerMarket';
  static const String community = '/commumity';
  static const String createpost = '/createpost';
  static const String pestDetection = '/pestDetection';
  static const String roverControl = '/roverControl';
  static const String chatBot = '/chatBot';
  static const String soilInfo = '/soilInfo';
  static const String addProduct = '/addProduct';
  static const String myProducts = '/myProducts';
  static const String updateProduct = '/updateProduct';
  static const String editProfile = '/editProfile';
  static const String connectionScreen = '/connectionScreen';
  static const String controlScreen = '/controlScreen';

  static final router =
      GoRouter(navigatorKey: getIt<GlobalKey<NavigatorState>>(), routes: [
    GoRoute(
      path: community,
      builder: (context, state) => const CommunityHomeScreen(),
    ),
    // في app_router.dart
    // في app_router.dart
    GoRoute(
      path: createpost,
      builder: (context, state) => BlocProvider(
        create: (context) => PostCubit(),
        child: const CreatePost(),
      ),
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
      builder: (context, state) {
        final cartProductsList = state.extra as List<CartProductModel>;
        return CartView(cartProductsList: cartProductsList);
      },
    ),
    GoRoute(
      path: payment,
      builder: (context, state) {
        final checkoutData = state.extra as CheckoutData;
        return PaymentView(checkoutData: checkoutData);
      },
    ),
    GoRoute(
      path: confirmDeliveryLocation,
      builder: (context, state) {
        final subtotalPrice = state.extra as double;
        return ConfirmDeliveryLocationView(subtotalPrice: subtotalPrice);
      },
    ),
    GoRoute(
      path: buyerHome,
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: homeContent,
      builder: (context, state) => const HomeContent(),
    ),
    GoRoute(
      path: popularProducts,
      builder: (context, state) => const PopularProductsView(),
    ),
    GoRoute(
      path: review,
      builder: (context, state) {
        final productId = state.extra as int;
        return ReviewsScreen(productId: productId);
      },
    ),

    GoRoute(
      path: category,
      builder: (context, state) => const CategoryView(),
    ),
    GoRoute(
      path: categoryscreen,
      builder: (context, state) => const CategorySection(),
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
    //farmer routes
    GoRoute(
      path: farmerHome,
      builder: (context, state) => const FarmerHomeScreen(),
    ),
    GoRoute(
      path: pestDetection,
      builder: (context, state) => const PestDetectionView(),
    ),
    GoRoute(
      path: roverControl,
      builder: (context, state) => const RoverControlView(),
    ),
    GoRoute(
      path: chatBot,
      builder: (context, state) => const ChatBotView(),
    ),
    GoRoute(
      path: soilInfo,
      builder: (context, state) => const SoilInfoView(),
    ),
    GoRoute(
      path: farmerMarket,
      builder: (context, state) => const MarketView(),
    ),
    GoRoute(
      path: addProduct,
      builder: (context, state) => BlocProvider(
        create: (context) => getIt<AddProductCubit>(),
        child: const AddProductsView(),
      ),
    ),
    GoRoute(
      path: myProducts,
      builder: (context, state) => BlocProvider(
        create: (context) => getIt<MyProductsCubit>()..getMyProducts(),
        child: const MyProductsView(),
      ),
    ),
    GoRoute(
      path: updateProduct,
      builder: (context, state) {
        final product = state.extra as MyProductEntity;
        return BlocProvider(
          create: (context) => getIt<UpdateProductCubit>(),
          child: UpdateProductsView(productData: product),
        );
      },
    ),
    GoRoute(
      path: profile,
      builder: (context, state) => const ProfileView(),
    ),
    GoRoute(
      path: editProfile,
      builder: (context, state) => BlocProvider(
        create: (context) => EditProfileCubit()..initializeControllers(),
        child: const EditProfile(),
      ),
    ),
    GoRoute(
      path: connectionScreen,
      builder: (context, state) => const ConnectionScreen(),
    ),
    GoRoute(
      path: controlScreen,
      builder: (context, state) {
        final socket = state.extra as Socket;
        return ControlScreen(socket: socket);
      },
    ),
  ]);
}
