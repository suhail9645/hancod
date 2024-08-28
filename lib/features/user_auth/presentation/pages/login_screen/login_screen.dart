import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hancod/core/manager/font_manager.dart';
import 'package:hancod/core/manager/space_manager.dart';
import 'package:hancod/features/user_auth/presentation/widgets/primary_button.dart';
class LoginScreen extends StatelessWidget {
 const LoginScreen({super.key});
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
   TextFormField(
    decoration:const InputDecoration(
      fillColor:  Color(0xffFCFCFD),
      border: OutlineInputBorder(borderSide: BorderSide())
    ),
   ),
   appSpaces.spaceForHeight20,
  PrimaryButton(onTap: () {
    
  }, title: 'Get Otp')
   ],),
 ),),
 );
 }
}