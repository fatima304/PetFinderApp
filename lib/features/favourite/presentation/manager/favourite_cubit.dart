import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../home/data/models/cat/cat_model_new.dart';
import 'favourite_state.dart';

class FavouriteCubit extends Cubit<FavouriteState> {
  FavouriteCubit() : super(const FavouriteInitial());

  final List<CatModelNew> _favouriteCats = [];

  List<CatModelNew> get favouriteCats => _favouriteCats;

  bool isFavourite(String? catId) {
    if (catId == null) return false;
    return _favouriteCats.any((cat) => cat.id == catId);
  }

  void toggleFavourite(CatModelNew cat) {
    if (isFavourite(cat.id)) {
      _favouriteCats.removeWhere((c) => c.id == cat.id);
    } else {
      _favouriteCats.add(cat);
    }
    emit(FavouriteSuccess(List.from(_favouriteCats)));
  }

  void loadFavourites() {
    emit(FavouriteSuccess(List.from(_favouriteCats)));
  }
}
