import 'package:flutter_app_e_commerece_online/domain/entities/ProductResponseEntity.dart';
import 'package:flutter_app_e_commerece_online/domain/use_cases/get_all_products_use_case.dart';
import 'package:flutter_app_e_commerece_online/ui/product/cubit/product_list_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductListTabViewModel extends Cubit<ProductListTabStates> {
  GetAllProductsUseCase getAllProductsUseCase;


  ProductListTabViewModel(
      {required this.getAllProductsUseCase,})
      : super(ProductListTabInitialStates());


  List<Products> productsList = [];

  static ProductListTabViewModel get(context) => BlocProvider.of(context);

  getProducts() async {
    emit(ProductListTabLoadingStates(loadingMessage: 'Loading'));
    var either = await getAllProductsUseCase.invoke();
    either.fold((l) {
      emit(ProductListTabErrorStates(errors: l));
    }, (response) {
      productsList = response.products ?? [];
      emit(ProductListTabSuccessStates(productResponseEntity: response));
    });
  }

}
