import 'package:hancod/features/service_listing/domain/entities/error_model.dart';
import 'package:hancod/features/service_listing/domain/entities/service_model.dart';


abstract class ServiceStates {
  
}

class ServiceInitialState extends ServiceStates{}


/// This states for fetching services

 class ServiceFetchingStates extends ServiceStates{

}

class ServiceFetchingSuccessStates extends ServiceFetchingStates{
  final List<ServiceModel>allServices;

  ServiceFetchingSuccessStates({required this.allServices});
}

class ServiceFetchErrorStates extends ServiceFetchingStates{
  final ServicErrorModel error;

  ServiceFetchErrorStates({required this.error});
}

class ServiceFetchLoadingStates extends ServiceFetchingStates{}