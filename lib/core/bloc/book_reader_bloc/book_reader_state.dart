part of 'book_reader_bloc.dart';

abstract class BookReaderState extends Equatable {
  const BookReaderState();

  @override
  List<Object> get props => [];
}

class BookReaderInitial extends BookReaderState {}

class BookReaderLoaded extends BookReaderState {}
