
import '../../dto/author/author_dto.dart';
import '../../global/locator_rest_client.dart';
import '../interfaces/iauthor_service.dart';

class AuthorService implements IAuthorService {
  final _restClient = getRestClient();
  @override
  Future<List<AuthorDto>> getAuthors() async {
    var _authors = await _restClient.getAuthors();
    return _authors;
  }

  @override
  Future<void> insertAuthor(AuthorDto author) async {
    await _restClient.createAuthor(author);
  }
}
