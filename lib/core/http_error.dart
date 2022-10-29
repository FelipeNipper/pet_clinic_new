import 'dart:convert';

class HttpError {
  String message;
  int statusCode;
  String error;

  HttpError({
    required this.message,
    required this.statusCode,
    required this.error,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'message': message,
      'statusCode': statusCode,
      'error': error,
    };
  }

  factory HttpError.fromMap(Map<String, dynamic> map) {
    return HttpError(
      message: map['message'] ?? '',
      statusCode: map['statusCode']?.toInt() ?? 0,
      error: map['error'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory HttpError.fromJson(String source) =>
      HttpError.fromMap(json.decode(source));
}
