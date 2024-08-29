import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:hancod/core/manager/color_manager.dart';
import 'package:hancod/core/manager/font_manager.dart';
import 'package:hancod/core/manager/space_manager.dart';
import 'package:hancod/core/widgets/primary_appbar.dart';

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
                    ...List.generate(
                      2,
                      (index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 6, vertical: 10),
                          child: Row(
                            children: [
                              Text(
                                '${index + 1}. Kitchen Cleaning',
                                style: appFont.f14w600Black
                                    .copyWith(color: const Color(0xff5F5F5F)),
                              ),
                              const Spacer(),
                              ColoredBox(
                                color: const Color(0xffECECEC),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
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
                                    Container(
                                      constraints:
                                          const BoxConstraints(minWidth: 35),
                                      child: Center(
                                        child: Text(
                                          '1',
                                          style: appFont.f14w600Black.copyWith(
                                            color: const Color(0xff5F5F5F),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
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
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 35,
                              ),
                              Text(
                                '\$125',
                                style: appFont.f14w600Black.copyWith(
                                  color: const Color(0xff5F5F5F),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
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
                    SizedBox(
                      height: 167,
                      child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Container(
                                height: 167,
                                width: 113,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                          color: const Color(0xffC8C8C8)
                                              .withOpacity(0.15),
                                          spreadRadius: 0,
                                          offset: const Offset(12, 26),
                                          blurRadius: 50)
                                    ]),
                                child: Column(
                                  children: [
                                    Container(
                                      height: 111,
                                      width: 113,
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.vertical(
                                            top: Radius.circular(7)),
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                'https://img.freepik.com/free-photo/woman-with-gloves-cleaning-floor_23-2148520978.jpg?t=st=1724898878~exp=1724902478~hmac=58ba8c89f8ae2fa6204cef33a8eaf28fdfb5a564edfa436e8140a9ab51c47829&w=826'),
                                            fit: BoxFit.fill),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8, vertical: 5),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Floor Cleaning',
                                            style: appFont.f10w0Grey.copyWith(
                                              color: const Color(0xff333333),
                                            ),
                                          ),
                                          appSpaces.spaceForHeight6,
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                '\$500',
                                                style: appFont.f12w600Black
                                                    .copyWith(
                                                  color:
                                                      const Color(0xff333333),
                                                ),
                                              ),
                                              Container(
                                                height: 20,
                                                width: 20,
                                                decoration: const BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    gradient: LinearGradient(
                                                        colors: [
                                                          Color(0xff5FCD70),
                                                          Color(0xff0E826B)
                                                        ])),
                                                child: const Center(
                                                  child: Icon(
                                                    Icons.add,
                                                    color: Colors.white,
                                                    size: 15,
                                                  ),
                                                ),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ));
                          },
                          separatorBuilder: (context, index) =>
                              appSpaces.spaceForWidth10,
                          itemCount: 6),
                    ),
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
                                      gradient: LinearGradient(colors: [
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
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                                colors: [Color(0xff5FCD70), Color(0xff0E826B)]),
                          ),
                          child: Center(
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
      floatingActionButton:  Container(
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
            child: Text('Grand Total  |  ₹898',style: appFont.f14w600Black.copyWith(color: Color(0xff444444)),),
          ),
          const Spacer(),
          Container(
            padding:const EdgeInsets.symmetric(horizontal: 15),
            height: 47,
               width: double.infinity,
               decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
               gradient: LinearGradient(
                                colors: [Color(0xff5FCD70), Color(0xff0E826B)])
               ),
               child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [SizedBox(),Text('Book Slot',style: appFont.f15w600White,),Icon(Icons.arrow_right,color: Colors.white,)],),
          )
        ],),
      ),
    );
  }
}
