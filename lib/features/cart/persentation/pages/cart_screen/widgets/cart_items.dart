
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hancod/core/manager/font_manager.dart';
import 'package:hancod/features/cart/persentation/controllers/cart_controller.dart';
import 'package:hancod/features/service_listing/domain/entities/service_model.dart';

class CartItems extends StatelessWidget {
  const CartItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child){
        List<ServiceModel>cartItems=ref.watch(cartProvider);
                     return     Column(children: 
      List.generate(
        cartItems.length,
        (index) {
          ServiceModel serviceModel=cartItems[index];
          return Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 6, vertical: 10),
            child: Row(
              children: [
                Text(
                  '${index + 1}. ${serviceModel.serviceName}',
                  style: appFont.f14w600Black
                      .copyWith(color: const Color(0xff5F5F5F)),
                ),
                const Spacer(),
              ColoredBox(
                  color: const Color(0xffECECEC),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GestureDetector(
                        onTap: () {
                           ref.read(cartProvider.notifier).removeFromCart(serviceModel.id);
                        },
                        child: Container(
                          height: 24,
                          width: 24,
                          decoration: BoxDecoration(
                            color: const Color(0xff5F5F5F),
                            borderRadius: BorderRadius.circular(3),
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.remove,
                              color: Colors.white,
                              size: 13,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        constraints:
                            const BoxConstraints(minWidth: 35),
                        child: Center(
                          child: Text(
                            serviceModel.orderCount.toString(),
                            style: appFont.f14w600Black.copyWith(
                              color: const Color(0xff5F5F5F),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          ref.read(cartProvider.notifier).increaseQuantity(serviceModel.id);
                        },
                        child: Container(
                          height: 24,
                          width: 24,
                          decoration: BoxDecoration(
                              color: const Color(0xff5F5F5F),
                              borderRadius:
                                  BorderRadius.circular(3)),
                          child: const Center(
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 13,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 35,
                ),
                Text(
                  '\$${serviceModel.price}',
                  style: appFont.f14w600Black.copyWith(
                    color: const Color(0xff5F5F5F),
                  ),
                ),
              ],
            ),
          );
        },
      ),
      );
      }
    );
  }
}
