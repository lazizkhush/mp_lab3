enum HttpStatus<T> {
  success<int>(200),
  created<int>(201),
  notFound<int>(404),
  serverError<int>(500);

  final T code;

  const HttpStatus(this.code);

  static HttpStatus<int>? fromCode(int code) {
    for (final status in HttpStatus<int>.values) {
      if (status.code == code) {
        return status;
      }
    }

    return null;
  }

  bool get isSuccess {
    return code == 200 || code == 201;
  }
}

void main() {
  final status = HttpStatus<int>.fromCode(404);

  print(status); // HttpStatus.notFound

  print(HttpStatus.success.code); // 200
  print(HttpStatus.success.isSuccess); // true
}