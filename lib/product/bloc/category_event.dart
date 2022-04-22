part of 'category_bloc.dart';

abstract class CategoryEvent extends Equatable {
  const CategoryEvent();

  @override
  List<Object> get props => [];
}

class CategoryLoad extends CategoryEvent {
  const CategoryLoad();
}

class CategorySelect extends CategoryEvent {
  final Category category;
  const CategorySelect({required this.category});

  @override
  List<Object> get props => [category];
}
