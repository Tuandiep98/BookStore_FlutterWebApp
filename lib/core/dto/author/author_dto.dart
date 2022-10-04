import 'package:json_annotation/json_annotation.dart';

part 'author_dto.g.dart';

@JsonSerializable()
class AuthorDto {
  String id;
  String name;
  String imgUrl;
  String bio;
  int age;
  int point;
  DateTime? createdAt;
  DateTime? updatedAt;

  AuthorDto({
    this.id = '',
    this.name = '',
    this.imgUrl = '',
    this.bio = '',
    this.age = 20,
    this.point = 0,
    this.createdAt,
    this.updatedAt,
  });
  factory AuthorDto.fromJson(Map<String, dynamic> json) =>
      _$AuthorDtoFromJson(json);
  Map<String, dynamic> toJson() => _$AuthorDtoToJson(this);
}
