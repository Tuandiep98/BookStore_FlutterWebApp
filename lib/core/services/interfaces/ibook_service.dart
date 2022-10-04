import '../../dto/book/book_dto.dart';

abstract class IBookService {
  Future<List<BookDto>> getBooks();
  Future<void> insertBook(BookDto book);
}
