import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:towermarket/admin/inventory/bloc/product_bloc.dart';
import 'package:towermarket_api_client/towermarket_api_client.dart';
import 'package:towermarket_repository/towermarket_repository.dart';

class InventoryPage extends StatelessWidget {
  const InventoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductBloc(ProductRepository())
        ..add(const ProductLoad(categoryId: "1")),
      child: Scaffold(
        appBar: AppBar(title: const Text("Admin")),
        body: BlocConsumer<ProductBloc, ProductState>(
          listener: (_, listner) {},
          builder: (_, state) {
            switch (state.status) {
              case ProductStatus.initial:
              case ProductStatus.loading:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              case ProductStatus.success:
                return ProductsDataTable(products: state.products);
              case ProductStatus.failure:
              default:
                return const Center(
                  child: Text("Something went wrong"),
                );
            }
          },
        ),
      ),
    );
  }
}

class ProductsDataTable extends StatelessWidget {
  final List<Product> products;
  const ProductsDataTable({
    Key? key,
    required this.products,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: const [
        DataColumn(label: Text('Title')),
        DataColumn(label: Text('Unit')),
        DataColumn(label: Text('Volumn')),
        DataColumn(label: Text('Price')),
        DataColumn(label: Text('Quantity')),
      ],
      rows: List.generate(products.length, (index) {
        return DataRow(
          cells: <DataCell>[
            DataCell(Text(products[index].title)),
            DataCell(Text(products[index].unit)),
            DataCell(Text(products[index].volume.toString())),
            DataCell(Text(products[index].price.toString())),
            DataCell(Text(products[index].quantity.toString())),
          ],
        );
      }),
    );
  }
}
