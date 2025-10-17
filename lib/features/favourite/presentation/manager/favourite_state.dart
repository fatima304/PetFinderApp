import 'package:meta/meta.dart';
import '../../../home/data/models/cat/cat_model_new.dart';

@sealed
abstract class FavouriteState {
  const FavouriteState();
}

class FavouriteInitial extends FavouriteState {
  const FavouriteInitial();
}

class FavouriteSuccess extends FavouriteState {
  final List<CatModelNew> favouriteCats;
  const FavouriteSuccess(this.favouriteCats);
}

class FavouriteFailure extends FavouriteState {
  final String message;
  const FavouriteFailure(this.message);
}
