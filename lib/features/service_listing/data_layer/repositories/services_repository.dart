import 'package:either_dart/either.dart';
import 'package:hancod/features/service_listing/domain/entities/error_model.dart';
import 'package:hancod/features/service_listing/domain/entities/service_model.dart';

abstract class ServicesRepo{
  Future<Either<ServicErrorModel, List<ServiceModel>>>getServices();
}