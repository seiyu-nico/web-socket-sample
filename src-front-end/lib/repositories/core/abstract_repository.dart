// Dart imports:
import 'dart:convert';

// Package imports:
import 'package:http/http.dart' as http;

abstract class AbstractRepository {
  Future<http.Response> get(Uri uri) async {
    final response = await http.get(
      uri,
      headers: {
        'content-type': 'application/json',
      },
    );

    return response;
  }

  Future<http.Response> put(Uri uri, Map<String, dynamic> body) async {
    final response = await http.put(
      uri,
      headers: {
        'content-type': 'application/json',
      },
      body: json.encode(body),
    );
    return response;
  }

  Future<http.Response> post(Uri uri, Map<String, dynamic> body) async {
    final response = await http.post(
      uri,
      headers: {
        'content-type': 'application/json',
      },
      body: json.encode(body),
    );
    return response;
  }

  Future<http.Response> delete(Uri uri, {Map<String, dynamic>? body}) async {
    final response = await http.delete(
      uri,
      headers: {
        'content-type': 'application/json',
      },
      body: json.encode(body),
    );

    return response;
  }
}
