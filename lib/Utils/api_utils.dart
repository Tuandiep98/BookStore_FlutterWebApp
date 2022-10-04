import 'package:dio/dio.dart';
import '../core/dto/error_api/error_api_dto.dart';
import '../core/ui_models/result_ui_model.dart';

class ApiUtils {
  static Future<ResultUIModel> handleApiCall(
      Future<void> Function() apiFunction) async {
    ResultUIModel result = ResultUIModel();

    try {
      await apiFunction();
      result.isSuccess = true;
      result.errorMessage = '';
    } on DioError catch (e) {
      try {
        ErrorApiDto errorResponse = ErrorApiDto.fromJson(e.response.data);
        result.isSuccess = false;
        result.errorMessage = errorResponse.errors!.first;
      } catch (e) {
        result.isSuccess = false;
        result.errorMessage = 'Unknown error.';
      }
    } catch (e) {
      result.isSuccess = false;
      result.errorMessage = 'Something went wrong.';
    }

    return result;
  }
}
