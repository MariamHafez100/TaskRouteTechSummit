import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_app_e_commerece_online/data/model/response/ProductResponseDto.dart';
import 'package:flutter_app_e_commerece_online/domain/entities/failures.dart';
import 'package:http/http.dart' as http;

class ApiManager {

  Future<Either<Failures, ProductResponseDto>> getAllProducts() async {
    // final connectivityResult = await (Connectivity().checkConnectivity());
    // if (connectivityResult == ConnectivityResult.mobile ||
    //     connectivityResult == ConnectivityResult.wifi) {
      // I am connected to a mobile network or wifi .
      Uri url = Uri.https('dummyjson.com', '/products');
      var response = await http.get(url);
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      var productResponse = ProductResponseDto.fromJson(json);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(productResponse);
      } else {
        return Left(ServerError(errorMessage: "product Api error"));
      }
    // } else {
    //   /// no internet connection
    //   return Left(NetworkError(errorMessage: 'Check Internet connection'));
    // }
  }






}
