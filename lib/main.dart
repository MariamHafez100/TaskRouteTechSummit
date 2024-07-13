import 'package:flutter/material.dart';
import 'package:flutter_app_e_commerece_online/ui/product/product_list_tab.dart';
import 'package:flutter_app_e_commerece_online/ui/utils/app_theme.dart';
import 'package:flutter_app_e_commerece_online/ui/utils/my_bloc_observer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();

  runApp(MyApp());
}
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(430, 932),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Scaffold(body: ProductListTab()),
            //initialRoute: HomeScreenView.routeName,
            // routes: {
            //
            //   HomeScreenView.routeName: (context) => HomeScreenView(),
            //   ProductDetailsView.routeName: (context) => ProductDetailsView(),
            //   //CartScreen.routeName: (context) => CartScreen()
            // },
            theme: AppTheme.mainTheme,
          );
        });
  }
}
