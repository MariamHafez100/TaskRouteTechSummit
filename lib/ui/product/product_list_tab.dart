import 'package:flutter/material.dart';
import 'package:flutter_app_e_commerece_online/domain/di.dart';
import 'package:flutter_app_e_commerece_online/ui/product/widgets/custom_text_field.dart';
import 'package:flutter_app_e_commerece_online/ui/product/widgets/grid_view_card_item.dart';
import 'package:flutter_app_e_commerece_online/ui/utils/my_assets.dart';
import 'package:flutter_app_e_commerece_online/ui/utils/my_colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'cubit/product_list_states.dart';
import 'cubit/product_list_tab_view_model.dart';


class ProductListTab extends StatefulWidget {
  @override
  State<ProductListTab> createState() => _ProductListTabState();
}

class _ProductListTabState extends State<ProductListTab> {
  ProductListTabViewModel viewModel = ProductListTabViewModel(
      getAllProductsUseCase: injectGetAllProductsUseCase());

  @override
  void initState() {
    super.initState();
    viewModel = ProductListTabViewModel(
      getAllProductsUseCase: injectGetAllProductsUseCase(),
    );
    viewModel.getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductListTabViewModel>(
      create: (context)=>viewModel..getProducts() ,
      child: BlocBuilder<ProductListTabViewModel,ProductListTabStates>(
          builder: (context,state){
            return  SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 17.w),
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10.h,
                      ),
                      Image.asset(
                        MyAssets.logo,
                        color: AppColors.primaryColor,
                      ),
                      SizedBox(
                        height: 18.h,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: CustomTextField(),
                          ),
                          SizedBox(
                            width: 24.w,
                          ),
                          InkWell(
                            onTap: () {
                            },
                            child: ImageIcon(
                              AssetImage(MyAssets.shoppingCart),
                              size: 28.sp,
                              color: AppColors.primaryColor,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      state is ProductListTabLoadingStates ?
                      const Center(child: CircularProgressIndicator(
                        color: AppColors.primaryColor,
                      ),)
                          :
                      Expanded(
                        child: GridView.builder(
                          itemCount: viewModel.productsList.length,
                          gridDelegate:
                          SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 2 / 2.4,
                              crossAxisSpacing: 16.w,
                              mainAxisSpacing: 16.h),
                          itemBuilder: (context, index) {
                            return InkWell(
                              splashColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () {

                              },
                              child: GridViewCardItem(productEntity: viewModel.productsList[index]),

                            );
                          },
                        ),
                      )
                    ]),
              ),
            );
          }
      ),
    );

  }
}
