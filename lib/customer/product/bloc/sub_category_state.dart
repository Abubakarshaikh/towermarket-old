part of 'sub_category_bloc.dart';

enum SubCategoryStatus { initial, loading, success, failure }

class SubCategoryState extends Equatable {
  final SubCategoryStatus status;
  final List<SubCategory> subCategories;
  const SubCategoryState(
      {this.subCategories = const [], this.status = SubCategoryStatus.initial});

  @override
  List<Object?> get props => [status, subCategories];
}
