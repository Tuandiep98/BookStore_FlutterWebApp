part of 'home_page_trending_bloc.dart';

abstract class HomePageTrendingState extends Equatable {
  const HomePageTrendingState();

  @override
  List<Object> get props => [];
}

class HomePageTrendingInitial extends HomePageTrendingState {}

class HomePageTrendingLoaded extends HomePageTrendingState {
  final List<BookDto> books;
  final List<AuthorDto> authors;

  const HomePageTrendingLoaded({
    required this.books,
    required this.authors,
  });

  @override
  List<Object> get props => [books, authors];
}

class HomePageTrendingError extends HomePageTrendingState {
  @override
  List<Object> get props => [];
}
