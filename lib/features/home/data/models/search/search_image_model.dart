import 'package:json_annotation/json_annotation.dart';
import 'package:pet_finder_app/features/home/data/models/cat/cat_model_new.dart';

part 'search_image_model.g.dart';

@JsonSerializable()
class SearchImageModel {
  final String? id;
  final String? url;
  final int? width;
  final int? height;
  final CatModelNew? breeds;

  SearchImageModel({
    this.id,
    this.url,
    this.width,
    this.height,
    this.breeds,
  });

  factory SearchImageModel.fromJson(Map<String, dynamic> json) =>
      _$SearchImageModelFromJson(json);

  Map<String, dynamic> toJson() => _$SearchImageModelToJson(this);
}
