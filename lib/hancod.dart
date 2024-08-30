
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hancod/core/manager/route_manager.dart';
import 'package:hancod/features/cart/persentation/pages/cart_screen/cart_screen.dart';
import 'package:hancod/features/user_auth/presentation/controllers/auth_controller.dart';
import 'package:hancod/features/user_auth/presentation/pages/welcome_screen/welcome_screen.dart';

class Hancode extends ConsumerStatefulWidget {
  const Hancode({super.key});

  @override
  ConsumerState<Hancode> createState() => _HancodeState();
}

class _HancodeState extends ConsumerState<Hancode> {
  // This widget is the root of your application.

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ref.read(authStateProvider.notifier).checkUserLogin();
  }
  @override
  Widget build(BuildContext context) {
    User? user=ref.read(authStateProvider.notifier).user;
    return MaterialApp.router(
      routerConfig: appRouter(user),
      
      title: 'Hancode',
      theme: ThemeData(
        textTheme:GoogleFonts.nunitoTextTheme(),
      
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
     
    );
  }
}
