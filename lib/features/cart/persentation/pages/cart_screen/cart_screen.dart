
import 'package:flutter/material.dart';
import 'package:hancod/core/manager/color_manager.dart';
import 'package:hancod/core/manager/font_manager.dart';
import 'package:hancod/core/manager/space_manager.dart';
import 'package:hancod/core/widgets/primary_appbar.dart';
import 'package:hancod/features/cart/persentation/pages/cart_screen/widgets/book_slot_container.dart';
import 'package:hancod/features/cart/persentation/pages/cart_screen/widgets/cart_items.dart';
import 'package:hancod/features/cart/persentation/pages/cart_screen/widgets/freaquently_added_container.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              appSpaces.spaceForHeight15,
              PrimaryAppBar(
                title: 'Cart',
                onBack: () {},
              ),
              appSpaces.spaceForHeight15,
              Expanded(
                child: ListView(
                  children: [
                  const  CartItems(),
                    appSpaces.spaceForHeight10,
                    Text(
                      'Add more Services',
                      style: appFont.f14w600Black.copyWith(
                        color: const Color(0xff4FB15E),
                      ),
                    ),
                    appSpaces.spaceForHeight15,
                    Text(
                      'Frequently added Services',
                      style: appFont.f14w600Black,
                    ),
                    appSpaces.spaceForHeight15,
                  const  FreaquentlyAddedServices(),
                    appSpaces.spaceForHeight15,
                    Container(
                      height: 98,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: const Color(0xffECECEC),
                          ),
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 32,
                            width: 134,
                            decoration: const BoxDecoration(
                                color: Color(0xffECECEC),
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10))),
                            child: Center(
                              child: Text(
                                'Coupon Code',
                                style: appFont.f15w600Black,
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 10),
                            width: double.infinity,
                            height: 35,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                  color: const Color(0xffECECEC),
                                ),
                                borderRadius: BorderRadius.circular(5)),
                            child: Row(
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                horizontal: 10),
                                        border: const OutlineInputBorder(
                                            borderSide: BorderSide.none),
                                        hintText: 'Enter Coupon Code',
                                        hintStyle: appFont.f10w0Grey.copyWith(
                                            color: const Color(0xff9A9FA5))),
                                  ),
                                ),
                                Container(
                                  height: 34,
                                  width: 81,
                                  decoration: BoxDecoration(
                                      gradient:const LinearGradient(colors: [
                                        Color(0xff5FCD70),
                                        Color(0xff0E826B)
                                      ]),
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Center(
                                      child: Text(
                                    'Apply',
                                    style: appFont.f14w600White,
                                  )),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    appSpaces.spaceForHeight10,
                    Row(
                      children: [
                        Container(
                          height: 24,
                          width: 24,
                          decoration:const BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                                colors: [Color(0xff5FCD70), Color(0xff0E826B)]),
                          ),
                          child:const Center(
                            child: Icon(
                              Icons.check,
                              color: Colors.white,
                              size: 15,
                            ),
                          ),
                        ),
                        appSpaces.spaceForWidth10,
                        Expanded(
                            child: Text(
                          'Your wallet balance is ₹125, you can redeem ₹10 in this order.',
                          style: appFont.f12w500Black
                              .copyWith(color: appColors.textGrey),
                        ))
                      ],
                    ),
                    appSpaces.spaceForHeight15,
                    Container(
                      height: 173,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: const Color(0xffECECEC))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 32,
                            width: 134,
                            decoration: const BoxDecoration(
                                color: Color(0xffECECEC),
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10))),
                            child: Center(
                              child: Text(
                                'Coupon Code',
                                style: appFont.f15w600Black,
                              ),
                            ),
                          ),
                          appSpaces.spaceForHeight6,
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 25, vertical: 8),
                            child: Column(
                              children: [
                                ...List.generate(
                                  4,
                                  (index) {
                                    return Padding(
                                      padding: const EdgeInsets.only(bottom: 7),
                                      child: Row(
                                        children: [
                                          Text(
                                            'Kitchen Cleaning',
                                            style: appFont.f10w0Grey.copyWith(
                                                color: const Color(0xff444444)),
                                          ),
                                          const Spacer(),
                                          Text('\$299',style: appFont.f10w0Grey.copyWith(
                                                color: const Color(0xff5F5F5F)),)
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              Row(children: List.generate(50,(index) {
                                return Expanded(child: ColoredBox(color:index%2==0?const  Color(0xff5F5F5F): Colors.transparent,child:const SizedBox(height: 1,),));
                              },),),
                              appSpaces.spaceForHeight6,
                              Row(children: [
                                Text('Total',style: appFont.f16w600Black,),
                                const Spacer(),
                                 Text('₹898',style: appFont.f16w600Black,),
                              ],)
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 120,)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton:const  BookSlotContainer(),
    );
  }
}
