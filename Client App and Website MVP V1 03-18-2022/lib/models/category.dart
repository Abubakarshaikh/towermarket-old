import 'dart:convert';

import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final String title;
  final String image;
  const Category({
    required this.title,
    required this.image,
  });

  Category copyWith({
    String? title,
    String? image,
  }) {
    return Category(
      title: title ?? this.title,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'image': image,
    };
  }

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      title: map['title'] ?? '',
      image: map['image'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Category.fromJson(String source) =>
      Category.fromMap(json.decode(source));

  @override
  String toString() => 'Category(title: $title, image: $image)';

  @override
  List<Object> get props => [title, image];
}
