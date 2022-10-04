import 'package:book_store/core/services/implements/author_service.dart';
import 'package:book_store/core/services/implements/book_service.dart';
import 'package:book_store/core/services/interfaces/iauthor_service.dart';
import 'package:book_store/core/services/interfaces/ibook_service.dart';
import 'package:get_it/get_it.dart';

void registerServiceSingletons(GetIt locator) {
  locator.registerLazySingleton<IBookService>(() => BookService());
  locator.registerLazySingleton<IAuthorService>(() => AuthorService());
}
