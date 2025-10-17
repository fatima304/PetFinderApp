import 'package:json_annotation/json_annotation.dart';
import 'package:pet_finder_app/features/home/data/models/cat/cat_model_new.dart';

part 'cat_response_model.g.dart';

@JsonSerializable()
class CatResponseModel {
  final List<CatModelNew> cats;

  CatResponseModel({required this.cats});

  factory CatResponseModel.fromJson(List<dynamic> json) =>
      CatResponseModel(
        cats: json.map((cat) => CatModelNew.fromJson(cat as Map<String, dynamic>)).toList(),
      );

  Map<String, dynamic> toJson() => _$CatResponseModelToJson(this);
}
