part of 'book_reader_bloc.dart';

abstract class BookReaderEvent extends Equatable {
  const BookReaderEvent();

  @override
  List<Object> get props => [];
}

class BookReaderStarted extends BookReaderEvent {
  final BookDto book;
  const BookReaderStarted({required this.book});

  @override
  List<Object> get props => [book];
}
