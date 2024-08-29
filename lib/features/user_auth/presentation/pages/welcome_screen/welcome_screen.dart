import 'package:flutter/material.dart';
import 'package:hancod/core/manager/color_manager.dart';
import 'package:hancod/core/manager/font_manager.dart';
import 'package:hancod/core/manager/image_manager.dart';
import 'package:hancod/core/manager/space_manager.dart';
import 'package:hancod/core/utils/dimensions.dart';
import 'package:hancod/core/widgets/primary_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: screenHeight(context) * 0.25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ColoredBox(color: appColors.primary, child: SizedBox(height: 72, width: 159, child: Center(child: Text('LOGO',style: appFont.f18w600White,),),)),
              ],
            ),
  SizedBox(
              height: screenHeight(context) * 0.25,
             
            ),
            Container(
              height: 51,
              width: screenWidth(context)<400?double.infinity:400,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color:const Color(0xffF1F1F1)
              ),
              child:Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Image.asset(appImages.googleLogo,),
                ),
                Text('Continue with Google',style: appFont.f16w600Black,)
              ],)
            ),
            appSpaces.spaceForHeight20,
            PrimaryButton(onTap: () {
              
            }, title: 'Phone')

          ],
        ),
      )),
    );
  }
}
