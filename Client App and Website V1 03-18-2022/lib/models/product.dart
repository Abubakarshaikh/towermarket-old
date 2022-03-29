import 'dart:convert';

class Product {
  final String name;
  final String photo;
  final int price;
  final DateTime createdAt;
  const Product({
    required this.name,
    required this.photo,
    required this.price,
    required this.createdAt,
  });

  Product copyWith({
    String? name,
    String? photo,
    int? price,
    DateTime? createdAt,
  }) {
    return Product(
      name: name ?? this.name,
      photo: photo ?? this.photo,
      price: price ?? this.price,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'photo': photo,
      'price': price,
      'createdAt': createdAt.millisecondsSinceEpoch,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      name: map['name'] ?? '',
      photo: map['photo'] ?? '',
      price: map['price']?.toInt() ?? 0,
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Products(name: $name, photo: $photo, price: $price, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Product &&
        other.name == name &&
        other.photo == photo &&
        other.price == price &&
        other.createdAt == createdAt;
  }

  @override
  int get hashCode {
    return name.hashCode ^ photo.hashCode ^ price.hashCode ^ createdAt.hashCode;
  }
}
