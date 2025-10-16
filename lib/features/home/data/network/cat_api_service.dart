import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../core/network/api_constants.dart';
import '../models/cat/cat_model_new.dart';
import '../models/search/search_image_model.dart';

part 'cat_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class CatApiService {
  factory CatApiService(Dio dio, {String? baseUrl}) = _CatApiService;

  @GET('${ApiConstants.breedsUrl}?api_key=${ApiConstants.apiKey}')
  Future<List<CatModelNew>> getCatBreeds();

  @GET('/images/search?breed_ids={breedId}&api_key=${ApiConstants.apiKey}')
  Future<List<SearchImageModel>> searchCatImages(@Path('breedId') String breedId);
}
