import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:towermarket_repository/towermarket_repository.dart';
import 'package:towermarket_api_client/towermarket_api_client.dart';
part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryRepository _categoryRepository;
  CategoryBloc(this._categoryRepository) : super(const CategoryState()) {
    on<CategoryLoad>(_onCategoryLoad);
    on<CategorySelect>(_onCategorySelect);
  }

  Future<void> _onCategoryLoad(
      CategoryLoad event, Emitter<CategoryState> emit) async {
    try {
      final fromRepo = await _categoryRepository.getAllProducts();
      emit(CategoryState(categories: fromRepo, status: CategoryStatus.success));
    } catch (e) {
      emit(const CategoryState(status: CategoryStatus.failure));
    }
  }

  void _onCategorySelect(CategorySelect event, Emitter<CategoryState> emit) {
    final state = this.state;

    final updatedState = state.categories.map((category) {
      return category == event.category
          ? event.category.copyWith(isSelected: true)
          : category.copyWith(isSelected: false);
    }).toList();

    emit(CategoryState(
        categories: updatedState, status: CategoryStatus.success));
  }
}
