import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hancod/core/manager/color_manager.dart';
import 'package:hancod/core/manager/font_manager.dart';
import 'package:hancod/core/manager/space_manager.dart';
import 'package:hancod/core/widgets/primary_appbar.dart';

class ServiceListingScreen extends StatefulWidget {
  const ServiceListingScreen({super.key});

  @override
  State<ServiceListingScreen> createState() => _ServiceListingScreenState();
}

class _ServiceListingScreenState extends State<ServiceListingScreen> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          appSpaces.spaceForHeight20,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: PrimaryAppBar(title: 'Cleaning Services', onBack: () {
              
            },),
          ),
          appSpaces.spaceForHeight20,
          ColoredBox(
            color: const Color(0xffD7FFEA),
            child: SizedBox(
              height: 50,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      List<String> titles = [
                        'Deep Cleaning',
                        'Maid Services',
                        'Car Cleaning',
                        'Carpet Cleaning'
                      ];
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            currentIndex = index;
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 6),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: index == currentIndex
                                ? const LinearGradient(colors: [
                                    Color(0xff5FCD70),
                                    Color(0xff0E826B)
                                  ])
                                : null,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 11),
                            child: Center(
                                child: Text(
                              titles[index],
                              style: appFont.f12w600Black,
                            )),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) =>
                        appSpaces.spaceForWidth5,
                    itemCount: 4),
              ),
            ),
          ),
          appSpaces.spaceForHeight15,
          Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 15),
                      height: 114,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(13),
                          boxShadow: [
                            BoxShadow(
                                color: const Color(0xff5C5C5C).withOpacity(0.1),
                                offset: const Offset(12, 26),
                                blurRadius: 50,
                                spreadRadius: 0)
                          ]),
                      child: Stack(
                        children: [
                          Row(
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 11),
                                height: 82,
                                width: 86,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(9),
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            'https://img.freepik.com/free-photo/close-up-hands-with-rubber-gloves-cleaning-floor_23-2148529593.jpg?t=st=1724868751~exp=1724872351~hmac=57e472996f364b0e4fe54381e000715b8df4322dfb1256ef35a0eb93ea3c2e6c&w=826'),
                                        fit: BoxFit.fill)),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 12),
                                  child: Column(
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                    Row(
                                     
                                      children: [
                                      Icon(Icons.star,color: Colors.amber,size: 16,),
                                      const SizedBox(width: 3,),
                                      Text('(4.2/5) 23 Orders',style: appFont.f12w600Black.copyWith(color: appColors.textGrey),),
                                      
                                    ],),
                                    appSpaces.spaceForHeight6,
                                      Text('Floor Deep Cleaning',style: appFont.f15w600Black,)
                                  ],),
                                ),
                                Row(
                                  
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('60 Minutes',style: appFont.f12w600Black.copyWith(color: const Color(0xff9A9FA5),),),
                                       const SizedBox(height: 3,),
                                        Text('\$499',style: appFont.f16w600Black,)
                                      ],
                                    ),
                                 
                                  ],
                                )
                              ],)
                            ],
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Container(
                                      height: 34,
                                      width: 84,
                                      decoration: BoxDecoration(
                                        color:index%2==0? appColors.primary:Color(0xffF1F1F1),
                                        gradient: index%2==0?const LinearGradient(colors: [
                                          Color(0xff5FCD70),
                                          Color(0xff0E826B),
                                          
                                        ],end: Alignment(0.95,0)):null,
                                        borderRadius:const BorderRadius.only(bottomRight: Radius.circular(13),topLeft: Radius.circular(13))
                                      ),
                                      child: index%2==0?Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                        Text('Add',style: appFont.f15w600White,),
                                        appSpaces.spaceForWidth10,
                                       const Icon(Icons.add,color: Colors.white,size: 22,)
                                      ],):Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                        Icon(Icons.remove,size: 22,color: appColors.primary,),
                                        Text('2',style: appFont.f15w600Black.copyWith(color: appColors.primary),),
                                        Icon(Icons.add,size: 22,color: appColors.primary,)

                                      ],),
                                    ),
                          )
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) =>
                      appSpaces.spaceForHeight20,
                  itemCount: 8)),
                  const SizedBox(height: 100,)
        ],
      )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        margin:const EdgeInsets.symmetric(horizontal: 15),
        height: 90,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Color(0xffECECEC)),
          boxShadow: [
            BoxShadow(
              color:const Color(0xff000000).withOpacity(0.3),
              blurRadius: 10,
              spreadRadius: 0

            )
          ]
        ),
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text('2 items  |  ₹3355',style: appFont.f14w600Black.copyWith(color: Color(0xff444444)),),
          ),
          const Spacer(),
          Container(
            padding:const EdgeInsets.symmetric(horizontal: 15),
            height: 47,
               width: double.infinity,
               decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(0xffFF6B4A)
               ),
               child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [SizedBox(),Text('VIEW CART',style: appFont.f15w600White,),Icon(Icons.arrow_right,color: Colors.white,)],),
          )
        ],),
      ),
    );
  }
}

