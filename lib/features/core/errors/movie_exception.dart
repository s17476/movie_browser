class MovieException implements Exception {
  String message;
  MovieException([this.message = 'Something went wrong']) {
    message = 'Movie Exception: $message';
  }

  @override
  String toString() => message;
}
