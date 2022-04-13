import 'package:flutter/material.dart';

class ProductEditButtonsTile extends StatelessWidget {
  const ProductEditButtonsTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 1.2)]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            child: const Icon(Icons.delete_outlined, color: Colors.red),
            onTap: () {},
          ),
          Text("1"),
          InkWell(
            child: const Icon(Icons.add),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
