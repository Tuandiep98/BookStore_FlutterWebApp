import 'package:json_annotation/json_annotation.dart';

part 'category_dto.g.dart';

@JsonSerializable()
class CategoryDto {
  String id;
  String authorId;
  String name;
  String imgUrl;
  DateTime? createdAt;
  DateTime? updatedAt;

  CategoryDto({
    this.id = '',
    this.authorId = '',
    this.name = '',
    this.imgUrl = '',
    this.createdAt,
    this.updatedAt,
  });
  factory CategoryDto.fromJson(Map<String, dynamic> json) =>
      _$CategoryDtoFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryDtoToJson(this);
}
