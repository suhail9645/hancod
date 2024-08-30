
import 'package:flutter/material.dart';
import 'package:hancod/core/manager/font_manager.dart';
import 'package:hancod/core/manager/space_manager.dart';

class FreaquentlyAddedServices extends StatelessWidget {
  const FreaquentlyAddedServices({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
    );
  }
}
