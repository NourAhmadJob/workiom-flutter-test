import 'package:json_annotation/json_annotation.dart';
import 'package:untitled/src/feature/auth/domain/entities/feature_value.dart';

part 'feature_value_model.g.dart';

@JsonSerializable()
class FeatureValueModel extends FeatureValue {
  FeatureValueModel({
    required super.name,
    required super.value,
  });

  factory FeatureValueModel.fromJson(Map<String, dynamic> json) =>
      _$FeatureValueModelFromJson(json);

  Map<String, dynamic> toJson() => _$FeatureValueModelToJson(this);
}

