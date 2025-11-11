import 'package:json_annotation/json_annotation.dart';
import 'package:untitled/src/feature/auth/domain/entities/edition.dart';
import 'package:untitled/src/feature/auth/domain/entities/feature_value.dart';

part 'edition_with_features.g.dart';

@JsonSerializable()
class EditionWithFeatures {
  final Edition edition;
  final List<FeatureValue> featureValues;

  EditionWithFeatures({required this.edition, required this.featureValues});

  factory EditionWithFeatures.fromJson(Map<String,dynamic>json) => _$EditionWithFeaturesFromJson(json);
}