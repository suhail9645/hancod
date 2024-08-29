
import 'package:flutter/material.dart';
import 'package:hancod/core/manager/font_manager.dart';

import '../manager/space_manager.dart';

class PrimaryAppBar extends StatelessWidget {
  const PrimaryAppBar({
    super.key, required this.title, required this.onBack,
  });
  final String title;
  final Function() onBack;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 32,
          width: 32,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color.fromARGB(255, 237, 245, 245)),
          child: const Center(
            child: Icon(
              Icons.keyboard_arrow_left_outlined,
              color: Color(0xff1D1617),
            ),
          ),
        ),
        appSpaces.spaceForWidth20,
        Text(
          title,
          style: appFont.f15w600Black,
        )
      ],
    );
  }
}