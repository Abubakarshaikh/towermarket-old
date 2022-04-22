import 'dart:convert';

import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String categoryId;
  final String title;
  final String unit;
  final int quantity;
  final int price;
  final String image;
  const Product({
    required this.categoryId,
    required this.title,
    required this.unit,
    required this.quantity,
    required this.price,
    required this.image,
  });

  Product copyWith({
    String? categoryId,
    String? title,
    String? unit,
    int? quantity,
    int? price,
    String? image,
  }) {
    return Product(
      categoryId: categoryId ?? this.categoryId,
      title: title ?? this.title,
      unit: unit ?? this.unit,
      quantity: quantity ?? this.quantity,
      price: price ?? this.price,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'categoryId': categoryId,
      'title': title,
      'unit': unit,
      'quantity': quantity,
      'price': price,
      'image': image,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      categoryId: map['categoryId'] ?? '',
      title: map['title'] ?? '',
      unit: map['unit'] ?? '',
      quantity: map['quantity']?.toInt() ?? 0,
      price: map['price']?.toInt() ?? 0,
      image: map['image'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Product(categoryId: $categoryId, title: $title, unit: $unit, quantity: $quantity, price: $price, image: $image)';
  }

  @override
  List<Object> get props {
    return [
      categoryId,
      title,
      unit,
      quantity,
      price,
      image,
    ];
  }
}
