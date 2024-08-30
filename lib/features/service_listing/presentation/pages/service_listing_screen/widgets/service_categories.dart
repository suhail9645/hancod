
import 'package:flutter/material.dart';
import 'package:hancod/core/manager/font_manager.dart';
import 'package:hancod/core/manager/space_manager.dart';

class CleaningCategories extends StatefulWidget {
  const CleaningCategories({
    super.key,
 
  });

  

  @override
  State<CleaningCategories> createState() => _CleaningCategoriesState();
}

class _CleaningCategoriesState extends State<CleaningCategories> {
   int currentIndex=1;
  @override
  Widget build(BuildContext context) {
    return ColoredBox(
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
    );
  }
}
