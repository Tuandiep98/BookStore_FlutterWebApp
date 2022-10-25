import 'package:bloc/bloc.dart';
import 'package:book_store/core/dto/book/book_dto.dart';
import 'package:book_store/core/dto/category/category_dto.dart';
import 'package:equatable/equatable.dart';

import '../../global/locator.dart';
import '../../services/interfaces/ibook_service.dart';

part 'book_event.dart';
part 'book_state.dart';

class BookBloc extends Bloc<BookEvent, BookState> {
  final _bookService = locator<IBookService>();
  List<BookDto> _books = [];
  List<CategoryDto> _categories = [];

  BookBloc() : super(BookInitial()) {
    on<BookStarted>((event, emit) async {
      final books = await _bookService.getBooks();
      if (books.length > 0) {
        _categories.clear();
        _books = books;
        for (var book in books) {
          var categories = book.categories;
          if (categories.length > 0) {
            for (var category in categories) {
              var isCategoryExisted =
                  _categories.any((x) => x.id == category.id);
              if (!isCategoryExisted) {
                _categories.add(category);
              }
            }
          }
        }
      }
      emit(BookLoaded(books: books, categories: _categories));
    });

    on<BookAdded>((event, emit) {
      // final state = this.state;
    });

    on<BookReload>((event, emit) {
      emit(BookInitial());
    });
  }

  List<BookDto> getCurrentBooks() => _books;
}
