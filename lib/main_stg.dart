import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hancod/firebase_options_prod.dart';
import 'package:hancod/hancod.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,name: 'hancode-stg');
  print('staginh');
  runApp(ProviderScope(child: const Hancode()));
}
