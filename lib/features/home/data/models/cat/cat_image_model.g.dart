// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cat_image_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CatImageModel _$CatImageModelFromJson(Map<String, dynamic> json) =>
    CatImageModel(
      id: json['id'] as String,
      width: (json['width'] as num).toInt(),
      height: (json['height'] as num).toInt(),
      url: json['url'] as String,
    );

Map<String, dynamic> _$CatImageModelToJson(CatImageModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'width': instance.width,
      'height': instance.height,
      'url': instance.url,
    };
