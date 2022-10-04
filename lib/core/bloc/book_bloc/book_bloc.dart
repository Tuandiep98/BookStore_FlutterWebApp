import 'package:bloc/bloc.dart';
import 'package:book_store/core/dto/book/book_dto.dart';
import 'package:equatable/equatable.dart';

import '../../global/locator.dart';
import '../../services/interfaces/ibook_service.dart';

part 'book_event.dart';
part 'book_state.dart';

class BookBloc extends Bloc<BookEvent, BookState> {
  final _bookService = locator<IBookService>();
  BookBloc() : super(BookInitial()) {
    on<BookStarted>((event, emit) async {
      final books = await _bookService.getBooks();
      emit(BookLoaded(books: books));
    });
    on<BookAdded>((event, emit) {
      // final state = this.state;
    });
  }
}
