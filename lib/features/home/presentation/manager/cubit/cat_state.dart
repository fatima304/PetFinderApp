import 'package:meta/meta.dart';
import '../../../data/models/cat/cat_model_new.dart';

@sealed
abstract class CatState {
  const CatState();
}

class CatInitial extends CatState {
  const CatInitial();
}

class CatLoading extends CatState {
  const CatLoading();
}

class CatSuccess extends CatState {
  final List<CatModelNew> cats;
  const CatSuccess(this.cats);
}

class CatFailure extends CatState {
  final String message;
  const CatFailure(this.message);
}