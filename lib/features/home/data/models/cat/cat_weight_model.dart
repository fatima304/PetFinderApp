import 'package:json_annotation/json_annotation.dart';

part 'cat_weight_model.g.dart';

@JsonSerializable()
class CatWeightModel {
  final String imperial;
  final String metric;

  CatWeightModel({
    required this.imperial,
    required this.metric,
  });

  factory CatWeightModel.fromJson(Map<String, dynamic> json) =>
      _$CatWeightModelFromJson(json);

  Map<String, dynamic> toJson() => _$CatWeightModelToJson(this);
}
