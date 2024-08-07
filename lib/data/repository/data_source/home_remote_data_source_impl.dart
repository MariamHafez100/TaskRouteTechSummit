import 'package:dartz/dartz.dart';
import 'package:flutter_app_e_commerece_online/data/api/api_manager.dart';

import 'package:flutter_app_e_commerece_online/domain/entities/ProductResponseEntity.dart';
import 'package:flutter_app_e_commerece_online/domain/entities/failures.dart';
import 'package:flutter_app_e_commerece_online/domain/repository/data_source/home_remote_data_source.dart';

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  ApiManager apiManager;

  HomeRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<Either<Failures, ProductResponseEntity>> getAllProducts()async {
    var either = await apiManager.getAllProducts();
    return either.fold((l) {
      return Left(Failures(errorMessage: l.errorMessage));
    }, (response) {
      return Right(response);
    });
  }


}
