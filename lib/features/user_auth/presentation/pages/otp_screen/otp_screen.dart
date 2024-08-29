import 'package:flutter/material.dart';
import 'package:hancod/core/manager/font_manager.dart';
import 'package:hancod/core/manager/space_manager.dart';
import 'package:hancod/core/widgets/primary_button.dart';
import 'package:pinput/pinput.dart';
class OtpScreen extends StatelessWidget {
 const OtpScreen({super.key});
 @override
 Widget build(BuildContext context) {
 return Scaffold(

 body: SafeArea(child: Padding(
   padding: EdgeInsets.symmetric(horizontal: 15),
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
      Pinput(length: 6,),
      appSpaces.spaceForHeight30,
      PrimaryButton(onTap: () {
        
      }, title: 'Login')
     ],),
   ),
 )),
 );
 
 }
}