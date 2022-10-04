import 'package:book_store/core/global/locator_rest_client.dart';

import '../../dto/book/book_dto.dart';
import '../interfaces/ibook_service.dart';

class BookService implements IBookService {
  final _restClient = getRestClient();
  @override
  Future<List<BookDto>> getBooks() async {
    var _books = await _restClient.getBooks();
    return _books;
  }

  @override
  Future<void> insertBook(BookDto book) async {
    await _restClient.createBook(book);
  }
}
