
import 'package:flutter_app_e_commerece_online/data/repository/repository/home_repository_impl.dart';

import 'package:flutter_app_e_commerece_online/domain/repository/data_source/home_remote_data_source.dart';

import 'package:flutter_app_e_commerece_online/domain/repository/repository/home_repository_contract.dart';
import 'package:flutter_app_e_commerece_online/domain/use_cases/get_all_products_use_case.dart';

import '../data/api/api_manager.dart';
import '../data/repository/data_source/home_remote_data_source_impl.dart';


GetAllProductsUseCase injectGetAllProductsUseCase() {
  return GetAllProductsUseCase(
      repositoryContract: injectHomeRepositoryContract());
}


HomeRepositoryContract injectHomeRepositoryContract() {
  return HomeRepositoryImpl(remoteDataSource: injectHomeRemoteDataSource());
}

HomeRemoteDataSource injectHomeRemoteDataSource() {
  return HomeRemoteDataSourceImpl(apiManager: ApiManager());
}


