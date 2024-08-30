
import 'package:flutter/material.dart';
import 'package:hancod/core/manager/font_manager.dart';
import 'package:hancod/core/manager/space_manager.dart';
import 'package:hancod/core/utils/dimensions.dart';

import '../manager/color_manager.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key, required this.onTap, required this.title, this.isLoading,
  });
final Function() onTap;
final String  title;
final bool? isLoading;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 51,
        width:  screenWidth(context)<400?double.infinity:400,
        decoration: BoxDecoration(color: appColors.primary,borderRadius: BorderRadius.circular(10)),
        child:isLoading!=null&&isLoading==true?Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Text('Wait',style: appFont.f16w600White,),
          appSpaces.spaceForWidth10,
       const  SizedBox(height: 30,width: 30, child:  CircularProgressIndicator(color: Colors.white,))
        ],) :Center(child: Text(title,style: appFont.f16w600White,),),
      ),
    );
  }
}
