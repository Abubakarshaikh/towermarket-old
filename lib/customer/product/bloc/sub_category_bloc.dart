import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:towermarket_repository/towermarket_repository.dart';
import 'package:towermarket_api_client/towermarket_api_client.dart';
part 'sub_category_event.dart';
part 'sub_category_state.dart';

class SubCategoryBloc extends Bloc<SubCategoryEvent, SubCategoryState> {
  final SubCategoryRepository _subCategoryRepository;
  SubCategoryBloc(this._subCategoryRepository)
      : super(const SubCategoryState()) {
    on<SubCategoryLoad>(_onSubCategoryLoad);
    on<SubCategorySelect>(_onSubCategorySelect);
  }

  Future<void> _onSubCategoryLoad(
      SubCategoryLoad event, Emitter<SubCategoryState> emit) async {
    try {
      final fromRepo = await _subCategoryRepository.getAllSubCategories();
      log("----------------+ $fromRepo +--------------");
      emit(SubCategoryState(
          subCategories: fromRepo, status: SubCategoryStatus.success));
    } catch (e) {
      emit(const SubCategoryState(status: SubCategoryStatus.failure));
    }
  }

  void _onSubCategorySelect(
      SubCategorySelect event, Emitter<SubCategoryState> emit) {
    final state = this.state;

    final updatedState = state.subCategories.map((category) {
      return category == event.subCategory
          ? event.subCategory.copyWith(isSelected: true)
          : category.copyWith(isSelected: false);
    }).toList();

    emit(SubCategoryState(
        subCategories: updatedState, status: SubCategoryStatus.success));
  }
}
