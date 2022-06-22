class Failure implements Exception {}

class ApiModel<T, E extends Failure> {
  final T? result;
  final E? failure;

  ApiModel({
    this.result,
    this.failure,
  });

  bool get hasError => failure != null;

  factory ApiModel.success(T result) {
    return ApiModel<T, E>(result: result);
  }

  factory ApiModel.error(E failure) {
    return ApiModel<T, E>(failure: failure);
  }
}
