// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edition_with_features_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EditionWithFeaturesModel _$EditionWithFeaturesModelFromJson(
  Map<String, dynamic> json,
) => EditionWithFeaturesModel(
  edition: Edition.fromJson(json['edition'] as Map<String, dynamic>),
  featureValues: (json['featureValues'] as List<dynamic>)
      .map((e) => FeatureValue.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$EditionWithFeaturesModelToJson(
  EditionWithFeaturesModel instance,
) => <String, dynamic>{
  'edition': instance.edition,
  'featureValues': instance.featureValues,
};
