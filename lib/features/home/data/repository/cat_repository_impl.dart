import 'dart:developer';
import 'package:pet_finder_app/features/home/data/models/search/search_image_model.dart';

import '../models/cat/cat_model_new.dart';
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
  Future<SearchImageModel?> searchBreedByName(String breedName) async {
    try {
      final breeds = await _catApiService.getCatBreeds();
      final breed = breeds.firstWhere(
        (b) => b.name!.toLowerCase() == breedName.toLowerCase(),
        orElse: () => CatModelNew(),
      );

      if (breed.id == null) return null;

      final images = await _catApiService.searchBreedImage(breed.id!);
      return images.isNotEmpty ? images.first : null;
    } catch (e) {
      log('CatRepositoryImpl: Error searching breed: $e');
      rethrow;
    }
  }

}
