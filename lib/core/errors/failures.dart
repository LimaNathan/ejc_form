class FormFailure implements Exception {
  final String message;
  FormFailure(this.message, {StackTrace? stackTrace});

  @override
  String toString() {
    return '$runtimeType: $message';
  }
}
