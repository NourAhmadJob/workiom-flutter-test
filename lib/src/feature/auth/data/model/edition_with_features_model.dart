import 'package:json_annotation/json_annotation.dart';
import 'package:untitled/src/feature/auth/domain/entities/edition_with_features.dart';
import 'package:untitled/src/feature/auth/domain/entities/edition.dart';
import 'package:untitled/src/feature/auth/domain/entities/feature_value.dart';

part 'edition_with_features_model.g.dart';

@JsonSerializable()
class EditionWithFeaturesModel extends EditionWithFeatures {
  EditionWithFeaturesModel({
    required super.edition,
    required super.featureValues,
  });

  factory EditionWithFeaturesModel.fromJson(Map<String, dynamic> json) =>
      _$EditionWithFeaturesModelFromJson(json);

  Map<String, dynamic> toJson() => _$EditionWithFeaturesModelToJson(this);
}

