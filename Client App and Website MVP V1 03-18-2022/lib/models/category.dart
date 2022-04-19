import 'dart:convert';

import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final String id;
  final String title;
  final String image;
  const Category({
    required this.id,
    required this.title,
    required this.image,
  });

  Category copyWith({
    String? id,
    String? title,
    String? image,
  }) {
    return Category(
      id: id ?? this.id,
      title: title ?? this.title,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'image': image,
    };
  }

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      id: map['id'] ?? '',
      title: map['title'] ?? '',
      image: map['image'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Category.fromJson(String source) =>
      Category.fromMap(json.decode(source));

  @override
  String toString() => 'Category(id: $id, title: $title, image: $image)';

  @override
  List<Object> get props => [id, title, image];
}
