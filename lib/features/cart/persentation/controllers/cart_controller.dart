import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hancod/features/service_listing/domain/entities/service_model.dart';

final cartProvider=StateNotifierProvider<CartNotifier,List<ServiceModel>>((ref) => CartNotifier(),);

class CartNotifier extends StateNotifier<List<ServiceModel>>{
  CartNotifier():super([]);
  int totalCount=0;
  double totalPrice=0;
  void addToCart(ServiceModel serviceModel){
    totalCount=totalCount+1;
    totalPrice=totalPrice+serviceModel.price;
    serviceModel.orderCount=1;
     state=[...state,serviceModel];
  }
  void removeFromCart(int id){
        for (var element in state) {
          if(element.id==id){
            element.orderCount=element.orderCount-1;
            totalPrice=totalPrice-element.price;
            if(element.orderCount==0){
              totalCount=totalCount-1;
              state.remove(element);
              break;
            }
          }
        }
        state=[...state];
  }
  increaseQuantity(int id){
        for (var element in state) {
          if(element.id==id){
            
            element.orderCount=element.orderCount+1;
            totalPrice=totalPrice+element.price;
          }
        }
        state=[...state];
  }
}