import 'package:either_dart/src/either.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hancod/features/user_auth/data_layer/models/auth_error_model.dart';
import 'package:hancod/features/user_auth/data_layer/repositories/auth_repository_impl.dart';

class AuthRepositoryImpl implements AuthRepository{
 late  FirebaseAuth _firebaseAuth;
  late GoogleSignIn _googleSignIn;

  AuthRepositoryImpl(){
_firebaseAuth=FirebaseAuth.instance;
_googleSignIn=GoogleSignIn();
  }



  @override
  Future<User?> loginWithGoogle()async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    UserCredential userCredential = await _firebaseAuth.signInWithCredential(credential);
    return userCredential.user;
    } catch (e) {
      print("==========================$e");
    }
     
  }
  
  @override
  Future<void> logout()async {
    await _googleSignIn.signOut();
    await _firebaseAuth.signOut();
  }

  @override
  Future<Either<AuthErrorModel,String>> getOtp({required String phone})async {
     try {
      String verId='';
        await _firebaseAuth.verifyPhoneNumber(
        phoneNumber: phone,
        verificationCompleted: (phoneAuthCredential) {
         _firebaseAuth.signInWithCredential(phoneAuthCredential);
       }, verificationFailed: (error) {
         return ;
       }, codeSent: (verificationId, forceResendingToken) {
         verId=verificationId;
       }, codeAutoRetrievalTimeout: (verificationId) {
         return;
       },);

       return Right(verId);
     } catch (e) {
       return Left(AuthErrorModel('', 'message'));
     }
  }
  
  @override
  User? checkUserLogin() {
 return  _firebaseAuth.currentUser;
  }
}
