import 'package:json_annotation/json_annotation.dart';

part 'book_dto.g.dart';

@JsonSerializable()
class BookDto {
  String id;
  String name;
  String category;
  String imgUrl;
  String title;
  String author;
  String description;
  int rate;
  int point;
  DateTime? createdAt;
  DateTime? updatedAt;

  BookDto({
    this.id = '',
    this.name = '',
    this.category = '',
    this.imgUrl = '',
    this.title = '',
    this.author = '',
    this.description = '',
    this.rate = 0,
    this.point = 0,
    this.createdAt,
    this.updatedAt,
  });
  factory BookDto.fromJson(Map<String, dynamic> json) =>
      _$BookDtoFromJson(json);
  Map<String, dynamic> toJson() => _$BookDtoToJson(this);
}
