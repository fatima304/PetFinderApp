// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cat_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CatResponseModel _$CatResponseModelFromJson(Map<String, dynamic> json) =>
    CatResponseModel(
      cats: (json['cats'] as List<dynamic>)
          .map((e) => CatModelNew.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CatResponseModelToJson(CatResponseModel instance) =>
    <String, dynamic>{'cats': instance.cats};
