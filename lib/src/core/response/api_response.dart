import 'package:json_annotation/json_annotation.dart';

part 'api_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class ApiResponse<T> {
  final T? result;
  final bool success;
  final ErrorModel? error;

  ApiResponse({this.result, required this.success, this.error});

  factory ApiResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonResponse,
  ) => _$ApiResponseFromJson(json, fromJsonResponse);


  Map<String,dynamic> toJson(Object? Function(T value) toJsonT) => _$ApiResponseToJson(this,toJsonT);
}


@JsonSerializable()
class ErrorModel {
  final int code;
  final String message;

  ErrorModel({required this.code, required this.message});

  factory ErrorModel.fromJson(Map<String,dynamic>json) => _$ErrorModelFromJson(json);
}
