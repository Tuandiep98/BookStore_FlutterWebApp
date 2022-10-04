// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookDto _$BookDtoFromJson(Map<String, dynamic> json) {
  return BookDto(
    id: json['id'] as String,
    name: json['name'] as String,
    category: json['category'] as String,
    imgUrl: json['imgUrl'] as String,
    title: json['title'] as String,
    author: json['author'] as String,
    description: json['description'] as String,
    rate: json['rate'] as int,
    point: json['point'] as int,
    createdAt: json['createdAt'] == null
        ? null
        : DateTime.parse(json['createdAt'] as String),
    updatedAt: json['updatedAt'] == null
        ? null
        : DateTime.parse(json['updatedAt'] as String),
  );
}

Map<String, dynamic> _$BookDtoToJson(BookDto instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'category': instance.category,
      'imgUrl': instance.imgUrl,
      'title': instance.title,
      'author': instance.author,
      'description': instance.description,
      'rate': instance.rate,
      'point': instance.point,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
