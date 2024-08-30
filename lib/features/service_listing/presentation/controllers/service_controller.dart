

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hancod/features/service_listing/data_layer/data_sources/service_imp.dart';
import 'package:hancod/features/service_listing/data_layer/repositories/services_repository.dart';
import 'package:hancod/features/service_listing/domain/entities/service_model.dart';
import 'package:hancod/features/service_listing/presentation/controllers/service_states.dart';

final serviceProvider=StateNotifierProvider<ServiceNotifier,ServiceStates>((ref) =>ServiceNotifier(ServiceImp()) ,);

class ServiceNotifier extends StateNotifier<ServiceStates>{
  final ServiceImp repo;
  ServiceNotifier(this.repo):super(ServiceInitialState());
  getAllServices()async{
    await Future.delayed(Durations.extralong1);
    state=ServiceFetchLoadingStates();
   final response=await repo.getServices();
   if(response.isRight){
    state=ServiceFetchingSuccessStates(allServices: response.right);
   }else{
    state=ServiceFetchErrorStates(error: response.left);
   }
  }
}