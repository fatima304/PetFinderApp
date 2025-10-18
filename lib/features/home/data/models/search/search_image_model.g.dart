// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_image_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchImageModel _$SearchImageModelFromJson(Map<String, dynamic> json) =>
    SearchImageModel(
      id: json['id'] as String,
      url: json['url'] as String,
      width: (json['width'] as num?)?.toInt(),
      height: (json['height'] as num?)?.toInt(),
    );

Map<String, dynamic> _$SearchImageModelToJson(SearchImageModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'width': instance.width,
      'height': instance.height,
    };
