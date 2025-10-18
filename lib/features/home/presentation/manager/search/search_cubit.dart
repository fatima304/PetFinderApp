// lib/features/home/presentation/manager/search/search_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/search/search_image_model.dart';
import '../../../data/repository/cat_repository.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final CatRepository _catRepository;

  SearchCubit(this._catRepository) : super(SearchInitial());

  Future<void> searchBreed(String query) async {
    if (query.trim().isEmpty) {
      emit(SearchEmpty());
      return;
    }

    emit(SearchLoading());
    try {
      final result = await _catRepository.searchBreedByName(query);
      if (result != null) {
        emit(SearchSuccess(result));
      } else {
        emit(SearchNotFound());
      }
    } catch (e) {
      emit(SearchFailure(e.toString()));
    }
  }
}
