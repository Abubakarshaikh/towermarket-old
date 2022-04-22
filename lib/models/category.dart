import 'dart:convert';

import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final String id;
  final String title;
  final String image;
  final bool isSelected;
  const Category({
    required this.id,
    required this.title,
    required this.image,
    this.isSelected = false,
  });

  Category copyWith({
    String? id,
    String? title,
    String? image,
    bool? isSelected,
  }) {
    return Category(
      id: id ?? this.id,
      title: title ?? this.title,
      image: image ?? this.image,
      isSelected: isSelected ?? this.isSelected,
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
  String toString() {
    return 'Category(id: $id, title: $title, image: $image, isSelected: $isSelected)';
  }

  @override
  List<Object> get props => [id, title, image, isSelected];
}
