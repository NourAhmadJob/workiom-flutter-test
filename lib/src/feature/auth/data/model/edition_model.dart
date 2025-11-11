import 'package:json_annotation/json_annotation.dart';
import 'package:untitled/src/feature/auth/domain/entities/edition.dart';

part 'edition_model.g.dart';

@JsonSerializable()
class EditionModel extends Edition {
  EditionModel({
    required super.name,
    required super.displayName,
    required super.id,
    required super.isRegistrable,
    required super.annualPrice,
    required super.isMostPopular,
    required super.hasTrial,
  });

  factory EditionModel.fromJson(Map<String, dynamic> json) =>
      _$EditionModelFromJson(json);

  Map<String, dynamic> toJson() => _$EditionModelToJson(this);
}

