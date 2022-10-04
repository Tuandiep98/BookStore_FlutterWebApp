import '../../dto/author/author_dto.dart';

abstract class IAuthorService {
  Future<List<AuthorDto>> getAuthors();
  Future<void> insertAuthor(AuthorDto author);
}
