import '../models/cat/cat_model_new.dart';
import '../models/search/search_image_model.dart';

abstract class CatRepository {
  Future<List<CatModelNew>> getCatBreeds();
  Future<List<SearchImageModel>> searchCatImages(String breedId);
}
