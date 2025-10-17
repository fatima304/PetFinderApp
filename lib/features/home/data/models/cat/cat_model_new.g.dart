// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cat_model_new.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CatModelNew _$CatModelNewFromJson(Map<String, dynamic> json) => CatModelNew(
  weight: json['weight'] == null
      ? null
      : CatWeightModel.fromJson(json['weight'] as Map<String, dynamic>),
  id: json['id'] as String?,
  name: json['name'] as String?,
  vetstreetUrl: json['vetstreet_url'] as String?,
  temperament: json['temperament'] as String?,
  origin: json['origin'] as String?,
  countryCodes: json['country_codes'] as String?,
  countryCode: json['country_code'] as String?,
  description: json['description'] as String?,
  lifeSpan: json['life_span'] as String?,
  indoor: (json['indoor'] as num?)?.toInt(),
  altNames: json['alt_names'] as String?,
  adaptability: (json['adaptability'] as num?)?.toInt(),
  affectionLevel: (json['affection_level'] as num?)?.toInt(),
  childFriendly: (json['child_friendly'] as num?)?.toInt(),
  dogFriendly: (json['dog_friendly'] as num?)?.toInt(),
  energyLevel: (json['energy_level'] as num?)?.toInt(),
  grooming: (json['grooming'] as num?)?.toInt(),
  healthIssues: (json['health_issues'] as num?)?.toInt(),
  intelligence: (json['intelligence'] as num?)?.toInt(),
  sheddingLevel: (json['shedding_level'] as num?)?.toInt(),
  socialNeeds: (json['social_needs'] as num?)?.toInt(),
  strangerFriendly: (json['stranger_friendly'] as num?)?.toInt(),
  vocalisation: (json['vocalisation'] as num?)?.toInt(),
  experimental: (json['experimental'] as num?)?.toInt(),
  hairless: (json['hairless'] as num?)?.toInt(),
  natural: (json['natural'] as num?)?.toInt(),
  rare: (json['rare'] as num?)?.toInt(),
  rex: (json['rex'] as num?)?.toInt(),
  suppressedTail: (json['suppressed_tail'] as num?)?.toInt(),
  shortLegs: (json['short_legs'] as num?)?.toInt(),
  wikipediaUrl: json['wikipedia_url'] as String?,
  referenceImageId: json['reference_image_id'] as String?,
  image: json['image'] == null
      ? null
      : CatImageModel.fromJson(json['image'] as Map<String, dynamic>),
);

Map<String, dynamic> _$CatModelNewToJson(CatModelNew instance) =>
    <String, dynamic>{
      'weight': instance.weight,
      'id': instance.id,
      'name': instance.name,
      'vetstreet_url': instance.vetstreetUrl,
      'temperament': instance.temperament,
      'origin': instance.origin,
      'country_codes': instance.countryCodes,
      'country_code': instance.countryCode,
      'description': instance.description,
      'life_span': instance.lifeSpan,
      'indoor': instance.indoor,
      'alt_names': instance.altNames,
      'adaptability': instance.adaptability,
      'affection_level': instance.affectionLevel,
      'child_friendly': instance.childFriendly,
      'dog_friendly': instance.dogFriendly,
      'energy_level': instance.energyLevel,
      'grooming': instance.grooming,
      'health_issues': instance.healthIssues,
      'intelligence': instance.intelligence,
      'shedding_level': instance.sheddingLevel,
      'social_needs': instance.socialNeeds,
      'stranger_friendly': instance.strangerFriendly,
      'vocalisation': instance.vocalisation,
      'experimental': instance.experimental,
      'hairless': instance.hairless,
      'natural': instance.natural,
      'rare': instance.rare,
      'rex': instance.rex,
      'suppressed_tail': instance.suppressedTail,
      'short_legs': instance.shortLegs,
      'wikipedia_url': instance.wikipediaUrl,
      'reference_image_id': instance.referenceImageId,
      'image': instance.image,
    };
