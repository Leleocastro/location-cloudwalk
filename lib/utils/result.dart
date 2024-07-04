typedef Result<A> = ({A? data, ResultError? error});
typedef ResultSuccess<A> = ({A? data, Null error});

extension ResultExtension on Result {
  bool get isSuccess => error == null;
  bool get isError => error != null;

  static Result<T> success<T>(T data) => (data: data, error: null);
  static Result<T> err<T>(String errorMsg, {String? errorCode}) => (data: null, error: ResultError(errorMsg, errorCode));
}

class ResultError {
  final String message;
  final String? code;

  ResultError(this.message, [this.code]);
}
