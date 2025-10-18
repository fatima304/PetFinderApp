import 'package:flutter_test/flutter_test.dart';
import 'package:pet_finder_app/features/favourite/presentation/manager/favourite_cubit.dart';
import 'package:pet_finder_app/features/favourite/presentation/manager/favourite_state.dart';
import 'package:pet_finder_app/features/home/data/models/cat/cat_image_model.dart';
import 'package:pet_finder_app/features/home/data/models/cat/cat_model_new.dart';
import 'package:pet_finder_app/features/home/data/models/cat/cat_weight_model.dart';

void main() {
  group('FavouriteCubit', () {
    test('initial state is FavouriteInitial', () {
      final cubit = FavouriteCubit();
      expect(cubit.state, const FavouriteInitial());
    });

    test('toggleFavourite adds and removes cat, emits FavouriteSuccess', () {
      final cubit = FavouriteCubit();
      final cat = CatModelNew(
        id: 'abys',
        name: 'Abyssinian',
        weight: CatWeightModel(imperial: '7 - 10', metric: '3 - 5'),
        image: CatImageModel(id: 'abys', width: 500, height: 500, url: 'https://example.com/img.jpg'),
      );

      expect(cubit.isFavourite('abys'), false);

      cubit.toggleFavourite(cat);
      expect(cubit.state, isA<FavouriteSuccess>());
      expect(cubit.isFavourite('abys'), true);

      cubit.toggleFavourite(cat);
      expect(cubit.state, isA<FavouriteSuccess>());
      expect(cubit.isFavourite('abys'), false);
    });
  });
}


