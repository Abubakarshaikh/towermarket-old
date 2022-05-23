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
  }

  Future<void> _onCategoryLoad(
      CategoryLoad event, Emitter<CategoryState> emit) async {
    try {
      final categories = await _categoryRepository.getAllCategories();
      emit(CategoryState(
          categories: categories, status: CategoryStatus.success));
    } catch (e) {
      emit(const CategoryState(status: CategoryStatus.failure));
    }
  }
}
