import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/repository/cat_repository.dart';
import 'cat_state.dart';

class CatCubit extends Cubit<CatState> {
  final CatRepository _catRepository;

  CatCubit(this._catRepository) : super(const CatInitial());

  Future<void> getCatBreeds() async {
    try {
      log('CatCubit: Starting to fetch cat breeds');
      emit(const CatLoading());
      final cats = await _catRepository.getCatBreeds();
      log('CatCubit: Successfully fetched ${cats.length} cats');
      emit(CatSuccess(cats));
    } catch (e) {
      log('CatCubit: Error fetching cat breeds: $e');
      emit(CatFailure(e.toString()));
    }
  }
}