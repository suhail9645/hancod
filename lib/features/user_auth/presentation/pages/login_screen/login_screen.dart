import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hancod/core/manager/color_manager.dart';
import 'package:hancod/core/manager/font_manager.dart';
import 'package:hancod/core/manager/space_manager.dart';
import 'package:hancod/core/widgets/primary_button.dart';
class LoginScreen extends StatefulWidget {
 const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
 TextEditingController phoneController=TextEditingController();
 final formKey=GlobalKey<FormState>();
bool isLoading =false;
 @override
 Widget build(BuildContext context) {
 return Scaffold(
 
 body: Center(child: Padding(
   padding: const EdgeInsets.symmetric(horizontal: 15),
   child: ListView(
    shrinkWrap: true,
    children: [
   
     Row(
      mainAxisAlignment: MainAxisAlignment.center,
       children: [
         Text('LogIn',style: appFont.f22w600Black,),
        
         
       ],
     ),
 appSpaces.spaceForHeight30,
   Form(
    key: formKey,
     child: TextFormField(
      controller: phoneController,
      decoration:const InputDecoration(
        fillColor:  Color(0xffFCFCFD),
        border: OutlineInputBorder(borderSide: BorderSide())
      ),
      validator: (value) {
        if(value==null|| value==''){
          return "Phone number is required";
        }else{
          return null;
        }
      },
     ),
   ),
   appSpaces.spaceForHeight20,
  PrimaryButton(
    isLoading: isLoading,
    onTap: () async{
    if(formKey.currentState!.validate()){
         setState(() {
           isLoading=true;
         });
          FirebaseAuth _firebaseAuth=FirebaseAuth.instance;
            await _firebaseAuth.verifyPhoneNumber(
        phoneNumber: '+91 ${phoneController.text.trim()}',
        verificationCompleted: (phoneAuthCredential) {
         _firebaseAuth.signInWithCredential(phoneAuthCredential).then((value) {
           
         },);
       }, verificationFailed: (error) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(error.message.toString())));

         return ;
       }, codeSent: (verificationId, forceResendingToken) {
          setState(() {
          isLoading=false;
        });
          context.go(Uri(path: '/otpScreen',queryParameters: {
            'verId':verificationId
          }).toString());
       }, codeAutoRetrievalTimeout: (verificationId) {
        setState(() {
          isLoading=false;
        });
         return;
       },);
    }
  }, title: 'Get Otp')
 
   ],),
 ),),
 );
 }
}