import 'package:json_annotation/json_annotation.dart';

part 'error_api_dto.g.dart';

@JsonSerializable()
class ErrorApiDto {
  List<String>? errors;
  bool isEmpty;

  ErrorApiDto({this.errors, this.isEmpty = false});
  factory ErrorApiDto.fromJson(Map<String, dynamic> json) =>
      _$ErrorApiDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ErrorApiDtoToJson(this);
}
