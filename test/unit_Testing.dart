// import 'package:flutter_test/flutter_test.dart';
// import 'package:connectivity/connectivity.dart';
// import 'package:http/http.dart' as http;
// import 'package:your_app_name/product_response_dto.dart';
// import 'package:your_app_name/failures.dart';
// import 'package:your_app_name/home_remote_data_source.dart';
//
// void main() {
//   test('getAllProducts should return Right(ProductResponseDto) when connected to the network', () async {
//     // Mocking the connectivity result
//     final mockConnectivity = MockConnectivity();
//     when(mockConnectivity.checkConnectivity()).thenAnswer((_) async => ConnectivityResult.wifi);
//
//     // Mocking the http response
//     final mockHttpClient = MockHttpClient();
//     final mockResponse = http.Response('{"id": 1, "name": "Product 1"}', 200);
//     when(mockHttpClient.get(any)).thenAnswer((_) async => mockResponse);
//
//     // Create an instance of HomeRemoteDataSource
//     final homeRemoteDataSource = HomeRemoteDataSourceImpl(
//       connectivity: mockConnectivity,
//       httpClient: mockHttpClient,
//     );
//
//     // Execute the function
//     final result = await homeRemoteDataSource.getAllProducts();
//
//     // Verify the result
//     expect(result, equals(Right(ProductResponseDto(id: 1, name: "Product 1"))));
//   });
//
//   test('getAllProducts should return Left(NetworkError) when not connected to the network', () async {
//     // Mocking the connectivity result
//     final mockConnectivity = MockConnectivity();
//     when(mockConnectivity.checkConnectivity()).thenAnswer((_) async => ConnectivityResult.none);
//
//     // Create an instance of HomeRemoteDataSource
//     final homeRemoteDataSource = HomeRemoteDataSourceImpl(
//       connectivity: mockConnectivity,
//       httpClient: http.Client(),
//     );
//
//     // Execute the function
//     final result = await homeRemoteDataSource.getAllProducts();
//
//     // Verify the result
//     expect(result, equals(Left(NetworkError(errorMessage: 'Check Internet connection'))));
//   });
//
//   test('getAllProducts should return Left(ServerError) when the API response is not successful', () async {
//     // Mocking the connectivity result
//     final mockConnectivity = MockConnectivity();
//     when(mockConnectivity.checkConnectivity()).thenAnswer((_) async => ConnectivityResult.wifi);
//
//     // Mocking the http response
//     final mockHttpClient = MockHttpClient();
//     final mockResponse = http.Response('{"error": "API error"}', 500);
//     when(mockHttpClient.get(any)).thenAnswer((_) async => mockResponse);
//
//     // Create an instance of HomeRemoteDataSource
//     final homeRemoteDataSource = HomeRemoteDataSourceImpl(
//       connectivity: mockConnectivity,
//       httpClient: mockHttpClient,
//     );
//
//     // Execute the function
//     final result = await homeRemoteDataSource.getAllProducts();
//
//     // Verify the result
//     expect(result, equals(Left(ServerError(errorMessage: 'Product API error'))));
//   });
// }
//
// // Mock classes for connectivity and http client
// class MockConnectivity extends Mock implements Connectivity {}
//
// class MockHttpClient extends Mock implements http.Client {}

import 'package:flutter_app_e_commerece_online/data/api/api_manager.dart';
import 'package:flutter_app_e_commerece_online/domain/entities/failures.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
// void main() {
//   test('Testing the fetching data', () {
// //setup
//    // Counter counter = Counter (value: 5);
// //do
//     //counter.incrementCounter();
// //test
//    // expect (counter.value, 6);
//   });
// }
// test/get_all_products_use_case_test.dart
// void main() {
//   TestWidgetsFlutterBinding.ensureInitialized(); // Ensure Flutter binding is initialized
//
//   test("Fetch Api", () async {
//     bool done = false;
//     var fetch = (await ApiManager().getAllProducts()).length;
//     if (fetch != 0) {
//       done = true;
//     }
//     expect(done, true);
//   });
// }



void main() {
  late ApiManager apiManager;

  setUp(() {
    apiManager = ApiManager();
  });

  test("Fetch Api", () async {
    bool done = false;
    var response = await apiManager.getAllProducts();
    if (response.isRight()) {
      var productResponse = response.fold((l) => null, (r) => r);
      if (productResponse != null) {
        done = true;
        print('Product list length: ${productResponse.products!.length}');
        for (var product in productResponse.products!) {
          print('Product: ${product.title}');
        }
      }
    }
    expect(done, true);
  });
}