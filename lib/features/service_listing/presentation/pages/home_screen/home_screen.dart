import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hancod/core/manager/color_manager.dart';
import 'package:hancod/core/manager/font_manager.dart';
import 'package:hancod/core/manager/space_manager.dart';
import 'package:hancod/core/utils/dimensions.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    print(screenWidth(context) * 0.65);
    return Scaffold(
      backgroundColor: const Color(0xffF8F8F8),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              appSpaces.spaceForHeight10,
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.waving_hand_rounded,
                    color: Colors.amber,
                  ),
                ],
              ),
              Row(
                children: [
                  const AddressExpansionTile(),
                  const Spacer(),
                  Container(
                      height: 45,
                      width: 45,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15)),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Icon(
                            Icons.shopping_cart,
                            color: appColors.primary,
                          ),
                          Positioned(
                            right: 5,
                            top: 5,
                            child: Container(
                              height: 14,
                              width: 14,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle, color: Colors.red),
                              child: const Center(
                                child: Text(
                                  '2',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 8),
                                ),
                              ),
                            ),
                          )
                        ],
                      ))
                ],
              ),
              appSpaces.spaceForHeight15,
              Expanded(
                  child: ListView(
                children: [
                  Container(
                    height: screenWidth(context) * 0.45,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        image: const DecorationImage(
                            image: NetworkImage(
                                'https://img.freepik.com/free-vector/cleaning-service-horizontal-banner-template-design_23-2150808844.jpg?w=1380&t=st=1724855519~exp=1724856119~hmac=876f0bb7e95ce52ca61e89261cf2ff7331f0871f05333444956004b4545c5c55'),
                            fit: BoxFit.fill),
                        borderRadius: BorderRadius.circular(15)),
                  ),
                  appSpaces.spaceForHeight15,
                  Container(
                    height: 51,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              offset: const Offset(0, 15),
                              blurRadius: 30,
                              spreadRadius: 0,
                              color: const Color(0xffCFCFCF).withOpacity(0.3))
                        ],
                        color: const Color(0xffFCFCFD),
                        borderRadius: BorderRadius.circular(12)),
                    child: TextFormField(
                      decoration: InputDecoration(
                          suffixIcon: Container(
                            margin: EdgeInsets.all(6),
                            height: 32,
                            width: 32,
                            decoration: BoxDecoration(
                                gradient: const LinearGradient(colors: [
                                  Color(0xff5FCD70),
                                  Color(0xff0E826B)
                                ]),
                                color: appColors.primary,
                                borderRadius: BorderRadius.circular(10)),
                            child: const Center(
                              child: Icon(
                                CupertinoIcons.search,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                          ),
                          hintText: 'Search for service',
                          hintStyle: appFont.f14w400Black
                              .copyWith(color: const Color(0xffB3B3B3)),
                          border: const OutlineInputBorder(
                              borderSide: BorderSide.none)),
                    ),
                  ),
                  appSpaces.spaceForHeight15,
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                    height: screenWidth(context) * 0.65,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text(
                            'Available Services',
                            style: appFont.f15w600Black
                                .copyWith(color: Color(0xff1A1D1F)),
                          ),
                        ),
                        appSpaces.spaceForHeight10,
                        Expanded(
                            child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 4,
                                  mainAxisExtent: 100,
                                  mainAxisSpacing: 10),
                          itemCount: 8,
                          itemBuilder: (context, index) {
                            List<String> images = [
                              'assets/images/cleaning_1.png',
                              'assets/images/cleaning_2.png',
                              'assets/images/cleaning_3.png',
                              'assets/images/cleaning_1.png',
                              'assets/images/cleaning_2.png',
                              'assets/images/cleaning_3.png',
                              'assets/images/cleaning_1.png'
                            ];
                            List<String> titles = [
                              'Cleaning',
                              'Laundry',
                              'Plumping',
                              'Dish washing',
                              'Cleaning',
                              'Laundry',
                              'Plumping'
                            ];
                            return Padding(
                              padding: EdgeInsets.zero,
                              child: Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      context.push('/serviceListingScreen');
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.only(bottom: 9),
                                      height: screenWidth(context) * 0.16,
                                      width: screenWidth(context) * 0.16,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: const Color(0xffF7F7F7),
                                          border: index == 7
                                              ? Border.all(color: Colors.grey)
                                              : null),
                                      child: Center(
                                          child: index != 7
                                              ? Image.asset(
                                                  images[index],
                                                  height: 30,
                                                )
                                              : Icon(
                                                  Icons.arrow_forward_outlined,
                                                  color: appColors.primary,
                                                )),
                                    ),
                                  ),
                                  Text(
                                    index != 7 ? titles[index] : 'See All',
                                    style: appFont.f12w500Black.copyWith(
                                        color: index != 7
                                            ? Colors.black
                                            : appColors.primary),
                                  )
                                ],
                              ),
                            );
                          },
                        )),
                      ],
                    ),
                  ),
                  appSpaces.spaceForHeight15,
                  Row(
                    children: [
                      Text(
                        'Cleaning Services',
                        style: appFont.f15w600Black
                            .copyWith(color: const Color(0xff1A1D1F)),
                      ),
                      const Spacer(),
                      SizedBox(
                        width: 90,
                        child: Row(
                          children: [
                            Text(
                              'See all',
                              style: appFont.f14w400Black
                                  .copyWith(color: appColors.primary),
                            ),
                            appSpaces.spaceForWidth5,
                            Icon(
                              Icons.arrow_forward,
                              color: appColors.primary,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  appSpaces.spaceForHeight15,
                  SizedBox(
                    height: 184,
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          List<String> images = [
                            'https://img.freepik.com/free-photo/girl-cleaning-house-with-vacuum-cleaner_1157-46766.jpg?t=st=1724861663~exp=1724865263~hmac=5970edd900d243e52a50df7a905335ed86d5b07afc0fa648d2deef4d8ef73568&w=900',
                            'https://img.freepik.com/free-photo/young-woman-with-rechargeable-vacuum-cleaner-cleaning-home_1303-27164.jpg?t=st=1724861780~exp=1724865380~hmac=1f48b5129afdee24d6ebc897b372a2847402b3fe6308f77b3acec5ba3bd04910&w=900',
                            'https://img.freepik.com/free-photo/woman-repairer-with-painting-roller-isolated_1303-14147.jpg?t=st=1724861834~exp=1724865434~hmac=a31a9ffddbe691d36c6af618324f80fa7c4b28533d880e8d5f2c94e3ef675824&w=900',
                            'https://img.freepik.com/free-photo/girl-cleaning-house-with-vacuum-cleaner_1157-46766.jpg?t=st=1724861663~exp=1724865263~hmac=5970edd900d243e52a50df7a905335ed86d5b07afc0fa648d2deef4d8ef73568&w=900',
                            'https://img.freepik.com/free-photo/young-woman-with-rechargeable-vacuum-cleaner-cleaning-home_1303-27164.jpg?t=st=1724861780~exp=1724865380~hmac=1f48b5129afdee24d6ebc897b372a2847402b3fe6308f77b3acec5ba3bd04910&w=900',
                            'https://img.freepik.com/free-photo/woman-repairer-with-painting-roller-isolated_1303-14147.jpg?t=st=1724861834~exp=1724865434~hmac=a31a9ffddbe691d36c6af618324f80fa7c4b28533d880e8d5f2c94e3ef675824&w=900'
                          ];
                          List<String> titles = [
                            'Carpet Cleaning',
                            'Sofa Cleaning',
                            'Painting',
                            'Carpet Cleaning',
                            'Sofa Cleaning',
                            'Painting'
                          ];
                          return Column(
                            children: [
                              Container(
                                
                                height: 154,
                                width: 139,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(13),
                                  image: DecorationImage(
                                      image: NetworkImage(images[index]),
                                      fit: BoxFit.fill),
                                ),
                              ),
                              appSpaces.spaceForHeight6,
                              Text(titles[index],style: appFont.f14w500Black.copyWith(color: const Color(0xff555555)),)
                            ],
                          );
                        },
                        separatorBuilder: (context, index) =>
                            appSpaces.spaceForWidth10,
                        itemCount: 6),
                  )
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}

class AddressExpansionTile extends StatefulWidget {
  const AddressExpansionTile({
    super.key,
  });

  @override
  State<AddressExpansionTile> createState() => _AddressExpansionTileState();
}

class _AddressExpansionTileState extends State<AddressExpansionTile> {
  bool expanded = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: screenWidth(context) - 150,
          child: Text(
            '406, Skyline Park Dale, MM Road 406, Skyline Park Dale, MM Road',
            style: appFont.f14w400Black.copyWith(color: appColors.textGrey),
            overflow: expanded ? null : TextOverflow.ellipsis,
          ),
        ),
        appSpaces.spaceForWidth10,
        GestureDetector(
            onTap: () {
              setState(() {
                expanded = !expanded;
              });
            },
            child: Icon(expanded
                ? Icons.keyboard_arrow_up_outlined
                : Icons.keyboard_arrow_down_outlined))
      ],
    );
  }
}
