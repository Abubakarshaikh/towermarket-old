import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:towermarket_admin/categories/categories.dart';
import 'package:towermarket_repository/towermarket_repository.dart';
import 'package:towermarket_ui/towermarket_ui.dart';
import 'products/bloc/product_bloc.dart';
import 'products/products.dart';

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
                ProductBloc(ProductRepository())..add(const ProductLoad())),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: TowermarketTheme.standard,
        home: const CategoriesPage(),
      ),
    );
  }
}
