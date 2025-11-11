import 'package:json_annotation/json_annotation.dart';

part 'all_feature.g.dart';

@JsonSerializable()
class AllFeature {
  final String name;
  final String displayName;
  final String description;
  final String defaultValue;

  AllFeature({
    required this.name,
    required this.displayName,
    required this.description,
    required this.defaultValue,
  });

  factory AllFeature.fromJson(Map<String,dynamic>json) => _$AllFeatureFromJson(json);
}
