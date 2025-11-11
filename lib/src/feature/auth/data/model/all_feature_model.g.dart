// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_feature_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllFeatureModel _$AllFeatureModelFromJson(Map<String, dynamic> json) =>
    AllFeatureModel(
      name: json['name'] as String,
      displayName: json['displayName'] as String,
      description: json['description'] as String,
      defaultValue: json['defaultValue'] as String,
    );

Map<String, dynamic> _$AllFeatureModelToJson(AllFeatureModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'displayName': instance.displayName,
      'description': instance.description,
      'defaultValue': instance.defaultValue,
    };
