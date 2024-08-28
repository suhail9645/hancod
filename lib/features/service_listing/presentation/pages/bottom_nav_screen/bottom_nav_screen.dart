import 'package:flutter/material.dart';
import 'package:hancod/core/manager/color_manager.dart';
import 'package:hancod/core/manager/space_manager.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int currentIndex=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     bottomNavigationBar: SizedBox(
      height: 80,
      child: Container(
        margin: EdgeInsets.fromLTRB(17, 0, 17, 20),
        height: 60,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Color(0xffC8C8C8).withOpacity(0.4),
              spreadRadius: 0,
              blurRadius: 20,
              offset: Offset(0, 20)
            ),
            
          ]
          
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(3, (index) {
              List<String>titles=['Home','Bookings','Profile'];
              List<IconData>icons=[Icons.home_filled,Icons.book_online_outlined,Icons.person_2_rounded];
            return GestureDetector(
              onTap: () {
                setState(() {
                  currentIndex=index;
                });
              },
              child: Container(height: 44,
              decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(10),
                    color: index==currentIndex?const Color(0xff53E88B).withOpacity(0.3):Colors.transparent
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Row(children: [
                  Icon(icons[index],color: index==currentIndex?appColors.primary:const Color(0xffB3B3B3),),
                  appSpaces.spaceForWidth10,
                  Text(titles[index])
                ],),
              ),),
            );
          },),),
        ),
      ),
     ),
      body: const SafeArea(
          child: Center(
        child: Text('bootom'),
      )),
    );
  }
}
