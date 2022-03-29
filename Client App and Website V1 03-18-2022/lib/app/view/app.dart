import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:towermarket/products/bloc/products_bloc.dart';
import 'package:towermarket/products/products.dart';
import 'package:towermarket/repository/products_repository.dart';
import 'package:towermarket/theme/theme.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (_) =>
                ProductsBloc(ProductsRepository())..add(const ProductsLoad())),
      ],
      child: MaterialApp(
        theme: TowermarketTheme.standard,
        home: const ProductsPage(),
      ),
    );
  }
}
