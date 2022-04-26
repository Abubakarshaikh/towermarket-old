import 'dart:convert';

import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String categoryId;
  final String title;
  final String unit;
  final int volume;
  final int price;
  final int quantity;
  final String image;
  const Product({
    required this.categoryId,
    required this.title,
    required this.unit,
    required this.volume ,
    required this.price,
    this.quantity = 0,
    required this.image,
  });

  Product copyWith({
    String? categoryId,
    String? title,
    String? unit,
    int? volume,
    int? price,
    int? quantity,
    String? image,
  }) {
    return Product(
      categoryId: categoryId ?? this.categoryId,
      title: title ?? this.title,
      unit: unit ?? this.unit,
      volume: volume ?? this.volume,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'categoryId': categoryId,
      'title': title,
      'unit': unit,
      'volume': volume,
      'price': price,
      'quantity': quantity,
      'image': image,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      categoryId: map['categoryId'] ?? '',
      title: map['title'] ?? '',
      unit: map['unit'] ?? '',
      volume: map['volume']?.toInt() ?? 0,
      price: map['price']?.toInt() ?? 0,
      quantity: map['quantity']?.toInt() ?? 0,
      image: map['image'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Product(categoryId: $categoryId, title: $title, unit: $unit, volume: $volume, price: $price, quantity: $quantity, image: $image)';
  }

  @override
  List<Object> get props {
    return [
      categoryId,
      title,
      unit,
      volume,
      price,
      quantity,
      image,
    ];
  }
}
