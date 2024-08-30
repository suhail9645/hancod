import 'package:either_dart/either.dart';
import 'package:hancod/core/manager/data_manager.dart';
import 'package:hancod/features/service_listing/data_layer/repositories/services_repository.dart';
import 'package:hancod/features/service_listing/domain/entities/service_model.dart';

import '../../domain/entities/error_model.dart';

class ServiceImp implements ServicesRepo{
  @override
  Future<Either<ServicErrorModel, List<ServiceModel>>> getServices()async {
    try {
       await Future.delayed(const Duration(seconds: 3));
    List<ServiceModel> allServices=ServiceModel.fromJsonList(services);
    return Right(allServices);
    } catch (e) {
      return Left(ServicErrorModel(message: 'Something went wrong'));
    }
   
  }
  
}