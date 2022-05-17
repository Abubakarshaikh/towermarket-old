import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:towermarket/category/bloc/category_bloc.dart';
import 'package:towermarket/home/view/home_page.dart';
import 'package:towermarket/product/product.dart';
import 'package:towermarket_repository/towermarket_repository.dart';
import 'package:towermarket_ui/towermarket_ui.dart';

import 'cart/bloc/cart_bloc.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );

    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (_) =>
                CategoryBloc(CategoryRepository())..add(const CategoryLoad())),
        BlocProvider(
            create: (_) =>
                ProductBloc(ProductRepository())..add(const ProductLoad())),
        BlocProvider(
            create: (_) => SubCategoryBloc(SubCategoryRepository())
              ..add(const SubCategoryLoad())),
        BlocProvider(create: (_) => CartBloc()..add(const CartLoad())),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: TowermarketTheme.standard,
        home: HomePage(),
      ),
    );
  }
}
