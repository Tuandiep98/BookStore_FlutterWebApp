import 'package:book_store/core/dto/author/author_dto.dart';
import 'package:book_store/core/dto/book/book_dto.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'rest_client.g.dart';

@RestApi()
abstract class RestClient {
  factory RestClient(Dio dio, {required String baseUrl}) = _RestClient;

  @GET("/api/Books")
  Future<List<BookDto>> getBooks();

  @POST("/api/CreateBook")
  Future<HttpResponse> createBook(@Body() BookDto model);

  @GET("/api/TrendingAuthor")
  Future<List<AuthorDto>> getAuthors();

  @POST("/api/CreateAuthor")
  Future<HttpResponse> createAuthor(@Body() AuthorDto model);
}
