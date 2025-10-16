import 'package:json_annotation/json_annotation.dart';
import 'cat_weight_model.dart';
import 'cat_image_model.dart';

part 'cat_model_new.g.dart';

@JsonSerializable()
class CatModelNew {
  final CatWeightModel? weight;
  final String? id;
  final String? name;
  @JsonKey(name: 'vetstreet_url')
  final String? vetstreetUrl;
  final String? temperament;
  final String? origin;
  @JsonKey(name: 'country_codes')
  final String? countryCodes;
  @JsonKey(name: 'country_code')
  final String? countryCode;
  final String? description;
  @JsonKey(name: 'life_span')
  final String? lifeSpan;
  final int? indoor;
  @JsonKey(name: 'alt_names')
  final String? altNames;
  final int? adaptability;
  @JsonKey(name: 'affection_level')
  final int? affectionLevel;
  @JsonKey(name: 'child_friendly')
  final int? childFriendly;
  @JsonKey(name: 'dog_friendly')
  final int? dogFriendly;
  @JsonKey(name: 'energy_level')
  final int? energyLevel;
  final int? grooming;
  @JsonKey(name: 'health_issues')
  final int? healthIssues;
  final int? intelligence;
  @JsonKey(name: 'shedding_level')
  final int? sheddingLevel;
  @JsonKey(name: 'social_needs')
  final int? socialNeeds;
  @JsonKey(name: 'stranger_friendly')
  final int? strangerFriendly;
  final int? vocalisation;
  final int? experimental;
  final int? hairless;
  final int? natural;
  final int? rare;
  final int? rex;
  @JsonKey(name: 'suppressed_tail')
  final int? suppressedTail;
  @JsonKey(name: 'short_legs')
  final int? shortLegs;
  @JsonKey(name: 'wikipedia_url')
  final String? wikipediaUrl;
  @JsonKey(name: 'reference_image_id')
  final String? referenceImageId;
  final CatImageModel? image;

  CatModelNew({
    this.weight,
    this.id,
    this.name,
    this.vetstreetUrl,
    this.temperament,
    this.origin,
    this.countryCodes,
    this.countryCode,
    this.description,
    this.lifeSpan,
    this.indoor,
    this.altNames,
    this.adaptability,
    this.affectionLevel,
    this.childFriendly,
    this.dogFriendly,
    this.energyLevel,
    this.grooming,
    this.healthIssues,
    this.intelligence,
    this.sheddingLevel,
    this.socialNeeds,
    this.strangerFriendly,
    this.vocalisation,
    this.experimental,
    this.hairless,
    this.natural,
    this.rare,
    this.rex,
    this.suppressedTail,
    this.shortLegs,
    this.wikipediaUrl,
    this.referenceImageId,
    this.image,
  });

  factory CatModelNew.fromJson(Map<String, dynamic> json) =>
      _$CatModelNewFromJson(json);

  Map<String, dynamic> toJson() => _$CatModelNewToJson(this);
}
