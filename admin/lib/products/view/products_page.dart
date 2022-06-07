import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:towermarket_api_client/towermarket_api_client.dart';
import 'package:towermarket_repository/towermarket_repository.dart';
import 'package:towermarket_ui/towermarket_ui.dart';

import '../bloc/product_bloc.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductBloc(ProductRepository())
        ..add(const ProductLoad(categoryId: "1")),
      child: Scaffold(
        appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(CupertinoIcons.profile_circled, color: Colors.white),
            ),
          ],
          backgroundColor: TowerMarketColors.firebrick,
          title: Text("Admin",
              style: TowerMarketTextStyle.headline4
                  .copyWith(color: TowerMarketColors.white)),
        ),
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
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.add),
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
    return Row(
      children: [
        Expanded(
          child: DataTable(
            border: const TableBorder(
              right: BorderSide(width: 1.4),
              left: BorderSide(width: 1.4),
              verticalInside: BorderSide(width: 1.4),
              horizontalInside: BorderSide(width: 1.4),
              bottom: BorderSide(width: 1.4),
            ),
            columns: const [
              DataColumn(label: DataColumnLabelText('No.')),
              DataColumn(label: DataColumnLabelText('Name')),
              DataColumn(label: DataColumnLabelText('Unit')),
              DataColumn(label: DataColumnLabelText('Volume')),
              DataColumn(label: DataColumnLabelText('Price')),
              DataColumn(label: DataColumnLabelText('Quantity')),
            ],
            rows: List.generate(products.length, (index) {
              return DataRow(
                cells: <DataCell>[
                  DataCell(
                      DataCellText((index + 1).toString(), readOnly: true)),
                  DataCell(DataCellText(products[index].title)),
                  DataCell(DataCellText(products[index].unit)),
                  DataCell(DataCellText(products[index].volume.toString())),
                  DataCell(DataCellText(products[index].price.toString())),
                  DataCell(DataCellText(products[index].quantity.toString())),
                ],
              );
            }),
          ),
        ),
      ],
    );
  }
}

class DataCellText extends StatefulWidget {
  final bool readOnly;
  final String value;
  const DataCellText(
    this.value, {
    Key? key,
    this.readOnly = false,
  }) : super(key: key);

  @override
  State<DataCellText> createState() => _DataCellTextState();
}

class _DataCellTextState extends State<DataCellText> {
  late final TextEditingController _value;
  @override
  void initState() {
    super.initState();
    _value = TextEditingController();
    _value.text = widget.value;
  }

  @override
  void dispose() {
    super.dispose();
    _value.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _value,
      style: TowerMarketTextStyle.title2,
      readOnly: widget.readOnly,
      decoration: const InputDecoration(border: InputBorder.none),
    );
  }
}

class DataColumnLabelText extends StatelessWidget {
  final String value;

  const DataColumnLabelText(this.value, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(value,
        style: TowerMarketTextStyle.title1.copyWith(
          fontWeight: FontWeight.w600,
          fontSize: 18.5,
        ));
  }
}
