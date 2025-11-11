import 'package:json_annotation/json_annotation.dart';

part 'edition.g.dart';

@JsonSerializable()
class Edition {
  final String name;
  final String displayName;
  final int id;
  final bool isRegistrable;
  final double? annualPrice;
  final bool? isMostPopular;
  final bool? hasTrial;

  Edition({
    required this.name,
    required this.displayName,
    required this.id,
    required this.isRegistrable,
    required this.annualPrice,
    required this.isMostPopular,
    required this.hasTrial,
  });

  factory Edition.fromJson(Map<String,dynamic>json) => _$EditionFromJson(json);
}
