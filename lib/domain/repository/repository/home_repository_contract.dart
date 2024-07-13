import 'package:dartz/dartz.dart';
import 'package:flutter_app_e_commerece_online/domain/entities/ProductResponseEntity.dart';
import 'package:flutter_app_e_commerece_online/domain/entities/failures.dart';

abstract class HomeRepositoryContract {
  Future<Either<Failures,ProductResponseEntity>> getAllProducts();
}