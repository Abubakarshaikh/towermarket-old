import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:towermarket/models/category.dart';
import 'package:towermarket/repository/category_repository.dart';

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
      final fromRepo = await _categoryRepository.getAllProducts();
      emit(CategoryState(categories: fromRepo, status: CategoryStatus.success));
    } catch (e) {
      emit(const CategoryState(status: CategoryStatus.failure));
    }
  }
}
