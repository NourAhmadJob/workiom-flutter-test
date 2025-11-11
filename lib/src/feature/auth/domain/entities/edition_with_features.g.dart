// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edition_with_features.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EditionWithFeatures _$EditionWithFeaturesFromJson(Map<String, dynamic> json) =>
    EditionWithFeatures(
      edition: Edition.fromJson(json['edition'] as Map<String, dynamic>),
      featureValues: (json['featureValues'] as List<dynamic>)
          .map((e) => FeatureValue.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$EditionWithFeaturesToJson(
  EditionWithFeatures instance,
) => <String, dynamic>{
  'edition': instance.edition,
  'featureValues': instance.featureValues,
};
