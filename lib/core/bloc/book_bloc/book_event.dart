part of 'book_bloc.dart';

abstract class BookEvent extends Equatable {
  const BookEvent();

  @override
  List<Object> get props => [];
}

class BookStarted extends BookEvent {
  @override
  List<Object> get props => [];
}

class BookAdded extends BookEvent {
  final BookDto bookDto;

  const BookAdded({
    required this.bookDto,
  });

  @override
  List<Object> get props => [bookDto];
}
