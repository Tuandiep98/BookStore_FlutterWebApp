class ResultUIModel {
  late bool isSuccess;
  late String errorMessage;
}

class DataResultUIModel<T> extends ResultUIModel {
  T data;

  DataResultUIModel(ResultUIModel result, this.data) {
    isSuccess = result.isSuccess;
    errorMessage = result.errorMessage;
  }
}
