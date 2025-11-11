import 'package:json_annotation/json_annotation.dart';
import 'package:untitled/src/feature/auth/domain/entities/get_editions.dart';
import 'package:untitled/src/feature/auth/domain/entities/all_feature.dart';
import 'package:untitled/src/feature/auth/domain/entities/edition_with_features.dart';

part 'get_editions_model.g.dart';

@JsonSerializable()
class GetEditionsModel extends GetEditions {
  GetEditionsModel({
    required super.allFeatures,
    required super.editionsWithFeatures,
  });

  factory GetEditionsModel.fromJson(Map<String, dynamic> json) =>
      _$GetEditionsModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetEditionsModelToJson(this);
}

