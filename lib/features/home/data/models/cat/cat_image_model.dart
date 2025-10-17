import 'package:json_annotation/json_annotation.dart';

part 'cat_image_model.g.dart';

@JsonSerializable()
class CatImageModel {
  final String id;
  final int width;
  final int height;
  final String url;

  CatImageModel({
    required this.id,
    required this.width,
    required this.height,
    required this.url,
  });

  factory CatImageModel.fromJson(Map<String, dynamic> json) =>
      _$CatImageModelFromJson(json);

  Map<String, dynamic> toJson() => _$CatImageModelToJson(this);
}
