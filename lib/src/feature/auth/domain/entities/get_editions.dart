import 'package:json_annotation/json_annotation.dart';
import 'package:untitled/src/feature/auth/domain/entities/all_feature.dart';
import 'package:untitled/src/feature/auth/domain/entities/edition_with_features.dart';

part 'get_editions.g.dart';

@JsonSerializable()
class GetEditions {
  final List<AllFeature> allFeatures;
  final List<EditionWithFeatures> editionsWithFeatures;

  GetEditions({required this.allFeatures, required this.editionsWithFeatures});

  factory GetEditions.fromJson(Map<String,dynamic>json) => _$GetEditionsFromJson(json);
}