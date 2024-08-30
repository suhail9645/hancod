import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hancod/features/user_auth/data_layer/repositories/auth_repository_impl.dart';
import '../../data_layer/data_sources/firebase_auth_service.dart';

enum GoogleSignInState {
  initial, loading, validated, notValidated
}
final authStateProvider=StateNotifierProvider<AuthNotifier,GoogleSignInState>((ref) => AuthNotifier(AuthRepositoryImpl()),);

class AuthNotifier extends StateNotifier<GoogleSignInState>{
  final AuthRepository repository;
  AuthNotifier(this.repository):super(GoogleSignInState.initial);
  User ? user;
  googleSignIn()async{
    state=GoogleSignInState.loading;
    final user=await repository.loginWithGoogle();
    if(user!=null){
      state=GoogleSignInState.validated;
    }else{
      state=GoogleSignInState.notValidated;
    }
  }

 /// This function for checking the user already login or not
  checkUserLogin(){
     user=repository.checkUserLogin();
  }

  logoutUser(){
    repository.logout();
  }
}