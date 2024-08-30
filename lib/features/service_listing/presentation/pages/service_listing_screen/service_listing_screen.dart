
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hancod/core/manager/color_manager.dart';
import 'package:hancod/core/manager/font_manager.dart';
import 'package:hancod/core/manager/space_manager.dart';
import 'package:hancod/core/widgets/primary_appbar.dart';
import 'package:hancod/features/cart/persentation/controllers/cart_controller.dart';
import 'package:hancod/features/service_listing/domain/entities/service_model.dart';
import 'package:hancod/features/service_listing/presentation/controllers/service_controller.dart';
import 'package:hancod/features/service_listing/presentation/controllers/service_states.dart';

import 'widgets/cart_navigation_bottom.dart';
import 'widgets/service_categories.dart';

class ServiceListingScreen extends ConsumerStatefulWidget {
  const ServiceListingScreen({super.key});

  @override
  @override
ConsumerState<ServiceListingScreen> createState() => _ServiceListingScreenState();
}

class _ServiceListingScreenState extends ConsumerState<ServiceListingScreen>  {
 
  @override
  void initState() {
   
    super.initState();
    if(mounted){
     ref.read(serviceProvider.notifier).getAllServices();
  }
  }
  @override
  Widget build(BuildContext context) {
    final state=ref.watch(serviceProvider);
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          appSpaces.spaceForHeight20,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: PrimaryAppBar(title: 'Cleaning Services', onBack: () {
              context.pop();
            },),
          ),
          appSpaces.spaceForHeight20,
         const CleaningCategories(),
          appSpaces.spaceForHeight15,
          Expanded(
            // child:state is ServiceFetchingSuccessStates? :CircularProgressIndicator(),
              child:Consumer(
                builder: (context, ref, child) {
                  final state=ref.watch(serviceProvider);
                  if(state is ServiceFetchingSuccessStates){

                return 
               ListView.separated(
                    itemBuilder: (context, index) {
                      ServiceModel serviceModel=state.allServices[index];

                      return Container(
                        margin:const EdgeInsets.symmetric(horizontal: 15),
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
                                  margin:const EdgeInsets.symmetric(horizontal: 11),
                                  height: 82,
                                  width: 86,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(9),
                                      image:const DecorationImage(
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
                                     const   Icon(Icons.star,color: Colors.amber,size: 16,),
                                        const SizedBox(width: 3,),
                                        Text('(${serviceModel.rating}/5) 23 Orders',style: appFont.f12w600Black.copyWith(color: appColors.textGrey),),
                                        
                                      ],),
                                      appSpaces.spaceForHeight6,
                                        Text(serviceModel.serviceName,style: appFont.f15w600Black,)
                                    ],),
                                  ),
                                  Row(
                                    
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(serviceModel.duration,style: appFont.f12w600Black.copyWith(color: const Color(0xff9A9FA5),),),
                                         const SizedBox(height: 3,),
                                          Text('\$${serviceModel.price}',style: appFont.f16w600Black,)
                                        ],
                                      ),
                                   
                                    ],
                                  )
                                ],)
                              ],
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: GestureDetector(
                                onTap: () {
                                  ref.read(cartProvider.notifier).addToCart(serviceModel);
                                },
                                child: Consumer(
                                  builder: (context, ref, child) {
                                    ref.watch(cartProvider);
                                bool cart=  ref.read(cartProvider).any((element) => serviceModel.id==element.id,);
                                 return Container(
                                            height: 34,
                                            width: 84,
                                            decoration: BoxDecoration(
                                              color:!cart? appColors.primary:const Color(0xffF1F1F1),
                                              gradient: !cart?const LinearGradient(colors: [
                                                Color(0xff5FCD70),
                                                Color(0xff0E826B),
                                                
                                              ],end: Alignment(0.95,0)):null,
                                              borderRadius:const BorderRadius.only(bottomRight: Radius.circular(13),topLeft: Radius.circular(13))
                                            ),
                                            child: !cart?Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                              Text('Add',style: appFont.f15w600White,),
                                              appSpaces.spaceForWidth10,
                                             const Icon(Icons.add,color: Colors.white,size: 22,)
                                            ],):Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              children: [
                                              GestureDetector(
                                                onTap: () {
                                                  ref.read(cartProvider.notifier).removeFromCart(serviceModel.id);
                                                },
                                                child: Icon(Icons.remove,size: 22,color: appColors.primary,)),
                                              Text(serviceModel.orderCount.toString(),style: appFont.f15w600Black.copyWith(color: appColors.primary),),
                                              GestureDetector(
                                                onTap: () {
                                                  ref.read(cartProvider.notifier).increaseQuantity(serviceModel.id);
                                                },
                                                child: Icon(Icons.add,size: 22,color: appColors.primary,))
                                                  
                                            ],),
                                          );
                                  }
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) =>
                        appSpaces.spaceForHeight20,
                    itemCount: state.allServices.length);
                }else if (state is ServiceFetchErrorStates){
                  return  Center(child: Text(state.error.message),);
                }else{
                   return const Center(child: CircularProgressIndicator(),);
                }
                }
              )
              ),
                  const SizedBox(height: 100,)
        ],
      )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton:const ViewCartBottomNav(),
    );
  }
}

