// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edition_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EditionModel _$EditionModelFromJson(Map<String, dynamic> json) => EditionModel(
  name: json['name'] as String,
  displayName: json['displayName'] as String,
  id: (json['id'] as num).toInt(),
  isRegistrable: json['isRegistrable'] as bool,
  annualPrice: (json['annualPrice'] as num?)?.toDouble(),
  isMostPopular: json['isMostPopular'] as bool?,
  hasTrial: json['hasTrial'] as bool?,
);

Map<String, dynamic> _$EditionModelToJson(EditionModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'displayName': instance.displayName,
      'id': instance.id,
      'isRegistrable': instance.isRegistrable,
      'annualPrice': instance.annualPrice,
      'isMostPopular': instance.isMostPopular,
      'hasTrial': instance.hasTrial,
    };
