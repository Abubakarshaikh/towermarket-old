part of 'sub_category_bloc.dart';

abstract class SubCategoryEvent extends Equatable {
  const SubCategoryEvent();

  @override
  List<Object> get props => [];
}

class SubCategoryLoad extends SubCategoryEvent {
  const SubCategoryLoad();
}

class SubCategorySelect extends SubCategoryEvent {
  final SubCategory subCategory;
  const SubCategorySelect({required this.subCategory});

  @override
  List<Object> get props => [subCategory];
}
