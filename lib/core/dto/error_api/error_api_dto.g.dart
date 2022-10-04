// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_api_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ErrorApiDto _$ErrorApiDtoFromJson(Map<String, dynamic> json) {
  return ErrorApiDto(
    errors: (json['errors'] as List).map((e) => e as String).toList(),
    isEmpty: json['isEmpty'] as bool,
  );
}

Map<String, dynamic> _$ErrorApiDtoToJson(ErrorApiDto instance) =>
    <String, dynamic>{
      'errors': instance.errors,
      'isEmpty': instance.isEmpty,
    };
