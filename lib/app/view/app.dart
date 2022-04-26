import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:towermarket/cart/bloc/cart_bloc.dart';
import 'package:towermarket/product/bloc/category_bloc.dart';
import 'package:towermarket/product/bloc/product_bloc.dart';
import 'package:towermarket/product/product.dart';
import 'package:towermarket/repository/category_repository.dart';
import 'package:towermarket/repository/product_repository.dart';
import 'package:towermarket/theme/theme.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (_) =>
                ProductBloc(ProductRepository())..add(const ProductLoad())),
        BlocProvider(
            create: (_) =>
                CategoryBloc(CategoryRepository())..add(const CategoryLoad())),
        BlocProvider(create: (_) => CartBloc()..add(const CartLoad())),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: TowermarketTheme.standard,
        home: const ProductPage(),
      ),
    );
  }
}
