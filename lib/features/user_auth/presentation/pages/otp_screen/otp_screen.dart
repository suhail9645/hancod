import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hancod/core/manager/font_manager.dart';
import 'package:hancod/core/manager/space_manager.dart';
import 'package:hancod/core/widgets/primary_button.dart';
import 'package:pinput/pinput.dart';
class OtpScreen extends StatefulWidget {
 const OtpScreen({super.key, required this.phoneNumber});
 final String phoneNumber;

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  TextEditingController otpController=TextEditingController();
  bool isLoading=false;
 @override
 Widget build(BuildContext context) {
 return Scaffold(

 body: SafeArea(child: Padding(
   padding:const EdgeInsets.symmetric(horizontal: 15),
   child: Center(
     child: ListView(
      shrinkWrap: true,
      children: [
      appSpaces.spaceForHeight30,
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('OTP',style: appFont.f22w600Black,),
        ],
      ),
      appSpaces.spaceForHeight20,
      Pinput(length: 6,controller: otpController,),
    
      appSpaces.spaceForHeight30,
      PrimaryButton(
        isLoading: isLoading,
        onTap: ()async {
          setState(() {
            isLoading=true;
          });
        FirebaseAuth _firebaseAuth=FirebaseAuth.instance;
        PhoneAuthCredential credential=PhoneAuthProvider.credential(verificationId: widget.phoneNumber, smsCode: otpController.text.trim());
        _firebaseAuth.signInWithCredential(credential).then((value) {
          context.pushReplacement('/homeScreen');
        },);
      }, title: 'Login')
     ],),
   ),
 )),
 );
 
 }
}