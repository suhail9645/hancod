import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hancod/core/manager/font_manager.dart';
import 'package:hancod/features/cart/persentation/controllers/cart_controller.dart';

class ViewCartBottomNav extends ConsumerWidget {
  const ViewCartBottomNav({
    super.key,
  });

  @override
  Widget build(BuildContext context, ref) {
    ref.watch(cartProvider);
    double totalPrice = ref.read(cartProvider.notifier).totalPrice;
    int totalCount = ref.read(cartProvider.notifier).totalCount;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      height: 90,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: const Color(0xffECECEC)),
          boxShadow: [
            BoxShadow(
                color: const Color(0xff000000).withOpacity(0.3),
                blurRadius: 10,
                spreadRadius: 0)
          ]),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              totalPrice == 0
                  ? 'No items in cart'
                  : '$totalCount items  |  \$$totalPrice',
              style:
                  appFont.f14w600Black.copyWith(color: const Color(0xff444444)),
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              context.push('/cartScreen');
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              height: 47,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xffFF6B4A)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(),
                  Text(
                    'VIEW CART',
                    style: appFont.f15w600White,
                  ),
                  const Icon(
                    Icons.arrow_right,
                    color: Colors.white,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
