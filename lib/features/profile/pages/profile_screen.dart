import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hancod/core/manager/color_manager.dart';
import 'package:hancod/core/manager/font_manager.dart';
import 'package:hancod/core/manager/space_manager.dart';
import 'package:hancod/features/user_auth/presentation/controllers/auth_controller.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              appSpaces.spaceForHeight10,
              Text(
                'My Account',
                style: appFont.f15w600Black,
              ),
              appSpaces.spaceForHeight15,
              Row(
                children: [
                  Container(
                    height: 45,
                    width: 45,
                    decoration: BoxDecoration(
                        gradient: const LinearGradient(
                            colors: [Color(0xff5FCD70), Color(0xff0E826B)]),
                        borderRadius: BorderRadius.circular(5)),
                    child: Center(
                      child: Text(
                        'MS',
                        style: appFont.f18w600White,
                      ),
                    ),
                  ),
                  appSpaces.spaceForWidth10,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Muhammed Suhail',
                        style: appFont.f18w600Black,
                      ),
                      Text(
                        '+91 908 786 4233',
                        style: appFont.f14w500Black
                            .copyWith(color: const Color(0xff444444)),
                      )
                    ],
                  )
                ],
              ),
              appSpaces.spaceForHeight20,
              Container(
                padding:const EdgeInsets.symmetric(horizontal: 22),
                height: 46,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xffD7FFF0),
                  borderRadius: BorderRadius.circular(8)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Text('Wallet',style: appFont.f16w600Black.copyWith(color: appColors.primary),),
                  Container(
                    height: 27,
                    width: 141,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(6)
                    ),
                    child: Center(child: Text('Balance- 125',style: appFont.f14w600Black.copyWith(color: appColors.primary),),),
                  )
                ],),
              ),
              appSpaces.spaceForHeight20,
              ...List.generate(7, (index) {
                List<String>titles=['Edit Profile','Saved Address','Terms & Conditions','Privacy Policy','Refer a Friend','Customer Support','Log Out'];
                List<IconData>icons=[Icons.person_pin,Icons.location_on,Icons.library_books_rounded,Icons.policy,Icons.group,Icons.call,Icons.logout];
             return Consumer(
              builder: (context, ref, child) => 
                GestureDetector(
                onTap: () {
                  ref.watch(authStateProvider.notifier).logoutUser();
                  context.pushReplacement('/loginScreen');
                },
                 child: Container(
                  margin:const  EdgeInsets.only(bottom: 10),
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: const Color(0xffECECEC)),
                    borderRadius: BorderRadius.circular(5)
                  ),
                  child: Row(children: [
                    Icon(icons[index],color: const Color(0xffB3B3B3),),
                    appSpaces.spaceForWidth20,
                 Text(titles[index],style: appFont.f16w600Black.copyWith(color: const Color(0xff444444)),)
                  ],),
                 ),
               ),
             );
              },)
            ],
          ),
        ),
      ),
    );
  }
}
