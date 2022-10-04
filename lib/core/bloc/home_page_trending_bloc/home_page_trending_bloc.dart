import 'package:bloc/bloc.dart';
import 'package:book_store/core/dto/author/author_dto.dart';
import 'package:book_store/core/dto/book/book_dto.dart';
import 'package:equatable/equatable.dart';

import '../../global/locator.dart';
import '../../services/interfaces/iauthor_service.dart';
import '../../services/interfaces/ibook_service.dart';

part 'home_page_trending_event.dart';
part 'home_page_trending_state.dart';

class HomePageTrendingBloc
    extends Bloc<HomePageTrendingEvent, HomePageTrendingState> {
  HomePageTrendingBloc() : super(HomePageTrendingInitial()) {
    final _bookService = locator<IBookService>();
    final _authorService = locator<IAuthorService>();

    on<HomePageTrendingStarted>((event, emit) async {
      final books = await _bookService.getBooks();
      final authors = await _authorService.getAuthors();
      books.sort((a, b) => b.point.compareTo(b.point));
      authors.sort((a, b) => b.point.compareTo(b.point));
      final trendingBooks = books.take(5).toList();
      final trendingAuthors = authors.take(5).toList();
      emit(HomePageTrendingLoaded(
          books: trendingBooks, authors: trendingAuthors));
    });
  }
}
