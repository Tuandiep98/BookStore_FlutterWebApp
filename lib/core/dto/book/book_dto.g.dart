// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookDto _$BookDtoFromJson(Map<String, dynamic> json) => BookDto(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      categories: (json['categories'] as List<dynamic>?)
              ?.map((e) => CategoryDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      imgUrl: json['imgUrl'] as String? ?? '',
      title: json['title'] as String? ?? '',
      authors: (json['authors'] as List<dynamic>?)
              ?.map((e) => AuthorDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      description: json['description'] as String? ?? '',
      rate: json['rate'] as int? ?? 0,
      point: json['point'] as int? ?? 0,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$BookDtoToJson(BookDto instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'categories': instance.categories.map((e) => e.toJson()).toList(),
      'imgUrl': instance.imgUrl,
      'title': instance.title,
      'authors': instance.authors.map((e) => e.toJson()).toList(),
      'description': instance.description,
      'rate': instance.rate,
      'point': instance.point,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
