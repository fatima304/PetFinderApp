import 'package:pet_finder_app/features/home/data/models/search/search_image_model.dart';

import '../models/cat/cat_model_new.dart';

abstract class CatRepository {
  Future<List<CatModelNew>> getCatBreeds();
    Future<SearchImageModel?> searchBreedByName(String breedName);

}
