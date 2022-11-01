import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'api_constants.dart';
import 'http_error.dart';

class HttpService {
  final http.Client client = http.Client();

  Future<http.Response> get(String url) async {
    String uri = ApiConstants.baseUrl + url;
    final http.Response response = await client.get(
      Uri.parse(uri),
    );
    _throwIfError(response);
    return response;
  }

  void _throwIfError(http.Response response) {
    if (response.statusCode >= 400) {
      HttpError error = HttpError.fromJson(response.body);
      throw HttpException(error.message);
    }
  }
}
