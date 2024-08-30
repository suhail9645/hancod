import 'package:either_dart/either.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hancod/features/user_auth/data_layer/data_sources/firebase_auth_service.dart';
import 'package:hancod/features/user_auth/data_layer/models/auth_error_model.dart';


abstract class AuthRepository {
  Future<User?> loginWithGoogle();
  Future<void> logout();
  Future<Either<AuthErrorModel,String>>getOtp({required String phone});
  User? checkUserLogin();
}
