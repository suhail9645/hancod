import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';
import 'package:hancod/features/cart/persentation/pages/cart_screen/cart_screen.dart';
import 'package:hancod/features/service_listing/presentation/pages/bottom_nav_screen/bottom_nav_screen.dart';
import 'package:hancod/features/service_listing/presentation/pages/home_screen/home_screen.dart';
import 'package:hancod/features/service_listing/presentation/pages/service_listing_screen/service_listing_screen.dart';
import 'package:hancod/features/user_auth/presentation/pages/login_screen/login_screen.dart';
import 'package:hancod/features/user_auth/presentation/pages/otp_screen/otp_screen.dart';
import 'package:hancod/features/user_auth/presentation/pages/welcome_screen/welcome_screen.dart';

GoRouter appRouter(User?user){
  return  GoRouter(
  initialLocation:user==null? '/':'/homeScreen',
  routes: [
    GoRoute(
      name: 'welcome',
      path: '/',
      builder: (context, state) =>const WelcomeScreen(),
    ),
    GoRoute(
      name: 'login',
      path: '/loginScreen',
      builder: (context, state) =>const LoginScreen(),
    ),
    GoRoute(
      name: 'homeScreen',
      path: '/homeScreen',
      builder: (context, state) =>const BottomNavScreen(),
    ),
    GoRoute(
      path: '/otpScreen',
      builder: (context, state) =>
          OtpScreen(phoneNumber: state.uri.queryParameters['verId']!),
    ),
    GoRoute(
      path: '/serviceListingScreen',
      builder: (context, state) =>const ServiceListingScreen(),
    ),
     GoRoute(
      path: '/cartScreen',
      builder: (context, state) =>const CartScreen(),
    ),
  ],
);
}

// final router =
