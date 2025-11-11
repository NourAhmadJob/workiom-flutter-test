import 'package:json_annotation/json_annotation.dart';

part 'feature_value.g.dart';

@JsonSerializable()
class FeatureValue {
  final String name;
  final String value;

  FeatureValue({required this.name, required this.value});
  
  factory FeatureValue.fromJson(Map<String,dynamic>json) => _$FeatureValueFromJson(json);
}