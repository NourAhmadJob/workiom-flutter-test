import 'package:json_annotation/json_annotation.dart';
import 'package:untitled/src/feature/auth/domain/entities/all_feature.dart';

part 'all_feature_model.g.dart';

@JsonSerializable()
class AllFeatureModel extends AllFeature {
  AllFeatureModel({
    required super.name,
    required super.displayName,
    required super.description,
    required super.defaultValue,
  });

  factory AllFeatureModel.fromJson(Map<String, dynamic> json) =>
      _$AllFeatureModelFromJson(json);

  Map<String, dynamic> toJson() => _$AllFeatureModelToJson(this);
}

