import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../dto/book/book_dto.dart';
part 'book_reader_event.dart';
part 'book_reader_state.dart';

class BookReaderBloc extends Bloc<BookReaderEvent, BookReaderState> {
  BookReaderBloc() : super(BookReaderInitial()) {
    on<BookReaderStarted>((event, emit) {
      //todo
    });
  }
}
