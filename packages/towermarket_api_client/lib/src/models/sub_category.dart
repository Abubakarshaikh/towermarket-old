import 'dart:convert';

import 'package:equatable/equatable.dart';

class SubCategory extends Equatable {
  final String id;
  final String title;
  final String image;
  final bool isSelected;
  const SubCategory({
    required this.id,
    required this.title,
    required this.image,
    this.isSelected = false,
  });

  SubCategory copyWith({
    String? id,
    String? title,
    String? image,
    bool? isSelected,
  }) {
    return SubCategory(
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
      'isSelected': isSelected,
    };
  }

  factory SubCategory.fromMap(Map<String, dynamic> map) {
    return SubCategory(
      id: map['id'] ?? '',
      title: map['title'] ?? '',
      image: map['image'] ?? '',
      isSelected: map['isSelected'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory SubCategory.fromJson(String source) =>
      SubCategory.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Category(id: $id, title: $title, image: $image, isSelected: $isSelected)';
  }

  @override
  List<Object> get props => [id, title, image, isSelected];
}
