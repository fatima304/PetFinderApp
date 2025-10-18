// lib/features/home/data/models/search/search_image_model.dart
import 'package:json_annotation/json_annotation.dart';

part 'search_image_model.g.dart';

@JsonSerializable()
class SearchImageModel {
  final String id;
  final String url;
  final int? width;
  final int? height;

  SearchImageModel({
    required this.id,
    required this.url,
    this.width,
    this.height,
  });

  factory SearchImageModel.fromJson(Map<String, dynamic> json) =>
      _$SearchImageModelFromJson(json);

  Map<String, dynamic> toJson() => _$SearchImageModelToJson(this);
}
