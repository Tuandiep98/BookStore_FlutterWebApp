part of 'book_bloc.dart';

abstract class BookState extends Equatable {
  const BookState();

  @override
  List<Object> get props => [];
}

class BookInitial extends BookState {}

class BookLoaded extends BookState {
  final List<BookDto> books;

  const BookLoaded({
    required this.books,
  });

  @override
  List<Object> get props => books;
}

class BookError extends BookState {
  @override
  List<Object> get props => [];
}
