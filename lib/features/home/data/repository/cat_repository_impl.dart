import 'dart:developer';
import '../models/cat/cat_model_new.dart';
import '../models/search/search_image_model.dart';
import '../network/cat_api_service.dart';
import 'cat_repository.dart';

class CatRepositoryImpl implements CatRepository {
  final CatApiService _catApiService;

  CatRepositoryImpl(this._catApiService);

  @override
  Future<List<CatModelNew>> getCatBreeds() async {
    try {
      log('CatRepositoryImpl: Calling API service');
      final response = await _catApiService.getCatBreeds();
      log('CatRepositoryImpl: Received ${response.length} cats from API');
      return response;
    } catch (e) {
      log('CatRepositoryImpl: Error in API call: $e');
      rethrow;
    }
  }

  @override
  Future<List<SearchImageModel>> searchCatImages(String breedId) async {
    try {
      log('CatRepositoryImpl: Searching images for breed ID: $breedId');
      final response = await _catApiService.searchCatImages(breedId);
      log('CatRepositoryImpl: Received ${response.length} search results');
      return response;
    } catch (e) {
      log('CatRepositoryImpl: Error in search API call: $e');
      rethrow;
    }
  }
}
