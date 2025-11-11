// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_editions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetEditions _$GetEditionsFromJson(Map<String, dynamic> json) => GetEditions(
  allFeatures: (json['allFeatures'] as List<dynamic>)
      .map((e) => AllFeature.fromJson(e as Map<String, dynamic>))
      .toList(),
  editionsWithFeatures: (json['editionsWithFeatures'] as List<dynamic>)
      .map((e) => EditionWithFeatures.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$GetEditionsToJson(GetEditions instance) =>
    <String, dynamic>{
      'allFeatures': instance.allFeatures,
      'editionsWithFeatures': instance.editionsWithFeatures,
    };
