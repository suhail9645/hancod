import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hancod/features/cart/persentation/pages/cart_screen/cart_screen.dart';
import 'package:hancod/features/service_listing/presentation/pages/bottom_nav_screen/bottom_nav_screen.dart';
import 'package:hancod/features/service_listing/presentation/pages/home_screen/home_screen.dart';
import 'package:hancod/features/service_listing/presentation/pages/service_listing_screen/service_listing_screen.dart';
import 'package:hancod/features/user_auth/presentation/pages/login_screen/login_screen.dart';
import 'package:hancod/features/user_auth/presentation/pages/otp_screen/otp_screen.dart';
import 'package:hancod/features/user_auth/presentation/pages/welcome_screen/welcome_screen.dart';
import 'package:hancod/firebase_options_prod.dart';
import 'package:hancod/hancod.dart';

void main()async {
   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,name: 'hancode');
  print('development');
  runApp(const Hancode());
}
