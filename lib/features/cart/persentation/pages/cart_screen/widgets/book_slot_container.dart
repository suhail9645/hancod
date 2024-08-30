
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hancod/core/manager/font_manager.dart';
import 'package:hancod/features/cart/persentation/controllers/cart_controller.dart';


class BookSlotContainer extends ConsumerWidget {
  const BookSlotContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context,ref) {
    return Container(
      margin:const EdgeInsets.symmetric(horizontal: 15),
      height: 90,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
       
        boxShadow: [
          BoxShadow(
            color:const Color(0xffD2D2D2).withOpacity(0.3),
            blurRadius: 10,
            spreadRadius: 0
            
          )
        ]
      ),
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Text('Grand Total  |  ₹${ref.read(cartProvider.notifier).totalPrice}',style: appFont.f14w600Black.copyWith(color:const Color(0xff444444)),),
        ),
        const Spacer(),
        Container(
          padding:const EdgeInsets.symmetric(horizontal: 15),
          height: 47,
             width: double.infinity,
             decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
             gradient:const LinearGradient(
                              colors: [Color(0xff5FCD70), Color(0xff0E826B)])
             ),
             child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [const SizedBox(),Text('Book Slot',style: appFont.f15w600White,),const Icon(Icons.arrow_right,color: Colors.white,)],),
        )
      ],),
    );
  }
}
