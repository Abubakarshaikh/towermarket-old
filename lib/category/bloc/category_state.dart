part of 'category_bloc.dart';

enum CategoryStatus { initial, loading, success, failure }

class CategoryState extends Equatable {
  final CategoryStatus status;

  final List<Category> categories;
  const CategoryState(
      {this.categories = const [], this.status = CategoryStatus.initial});

  @override
  List<Object> get props => [categories, status];
}
