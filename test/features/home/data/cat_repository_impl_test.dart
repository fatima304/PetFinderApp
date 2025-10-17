import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pet_finder_app/features/home/data/models/cat/cat_image_model.dart';
import 'package:pet_finder_app/features/home/data/models/cat/cat_model_new.dart';
import 'package:pet_finder_app/features/home/data/models/cat/cat_weight_model.dart';
import 'package:pet_finder_app/features/home/data/network/cat_api_service.dart';
import 'package:pet_finder_app/features/home/data/repository/cat_repository_impl.dart';

class _MockCatApiService extends Mock implements CatApiService {}

void main() {
  late _MockCatApiService mockApi;
  late CatRepositoryImpl repository;

  setUp(() {
    mockApi = _MockCatApiService();
    repository = CatRepositoryImpl(mockApi);
  });

  group('CatRepositoryImpl.getCatBreeds', () {
    test('returns list from api on success', () async {
      final cats = [
        CatModelNew(
          id: 'abys',
          name: 'Abyssinian',
          origin: 'Egypt',
          lifeSpan: '14',
          weight: CatWeightModel(imperial: '7 - 10', metric: '3 - 5'),
          image: CatImageModel(
            id: 'img1',
            url: 'https://cdn2.thecatapi.com/images/0XYvRd7oD.jpg',
            width: 1200,
            height: 800,
          ),
        ),
      ];

      when(() => mockApi.getCatBreeds()).thenAnswer((_) async => cats);

      final result = await repository.getCatBreeds();

      expect(result, cats);
      verify(() => mockApi.getCatBreeds()).called(1);
      verifyNoMoreInteractions(mockApi);
    });

    test('rethrows when api throws', () async {
      when(() => mockApi.getCatBreeds()).thenThrow(Exception('network'));

      expect(repository.getCatBreeds(), throwsException);
      verify(() => mockApi.getCatBreeds()).called(1);
      verifyNoMoreInteractions(mockApi);
    });
  });
}


