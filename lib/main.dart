import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hancod/features/cart/persentation/pages/cart_screen/cart_screen.dart';
import 'package:hancod/features/service_listing/presentation/pages/bottom_nav_screen/bottom_nav_screen.dart';
import 'package:hancod/features/service_listing/presentation/pages/home_screen/home_screen.dart';
import 'package:hancod/features/service_listing/presentation/pages/service_listing_screen/service_listing_screen.dart';
import 'package:hancod/features/user_auth/presentation/pages/login_screen/login_screen.dart';
import 'package:hancod/features/user_auth/presentation/pages/otp_screen/otp_screen.dart';
import 'package:hancod/features/user_auth/presentation/pages/welcome_screen/welcome_screen.dart';

void main() {
  runApp(const Hancode());
}

class Hancode extends StatelessWidget {
  const Hancode({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hancode',
      theme: ThemeData(
        textTheme:GoogleFonts.nunitoTextTheme(),
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:CartScreen()
    );
  }
}
