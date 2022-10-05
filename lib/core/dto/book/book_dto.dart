import 'package:book_store/core/dto/author/author_dto.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../category/category_dto.dart';

part 'book_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class BookDto extends Equatable {
  String id;
  String name;
  List<CategoryDto> categories;
  String imgUrl;
  String title;
  List<AuthorDto> authors;
  String description;
  int rate;
  int point;
  DateTime? createdAt;
  DateTime? updatedAt;

  BookDto({
    this.id = '',
    this.name = '',
    this.categories = const [],
    this.imgUrl = '',
    this.title = '',
    this.authors = const [],
    this.description = '',
    this.rate = 0,
    this.point = 0,
    this.createdAt,
    this.updatedAt,
  });
  factory BookDto.fromJson(Map<String, dynamic> json) =>
      _$BookDtoFromJson(json);
  Map<String, dynamic> toJson() => _$BookDtoToJson(this);

  @override
  List<Object?> get props => [
        this.id,
        this.name,
        this.categories,
        this.imgUrl,
        this.title,
        this.authors,
        this.description,
        this.rate,
        this.point,
        this.createdAt,
        this.updatedAt,
      ];
}
