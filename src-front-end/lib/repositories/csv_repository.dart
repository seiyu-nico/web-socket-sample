// Dart imports:
import 'dart:convert';

// Project imports:
import 'package:websocket_sample/config/url_config.dart';
import 'package:websocket_sample/repositories/core/abstract_repository.dart';

class CsvRepository extends AbstractRepository {
  Future<Map> download() async {
    final uri = Uri.parse('${UrlConfig.baseUrl}/csv-download');
    final response = await get(uri);
    return jsonDecode(response.body) as Map<String, dynamic>;
  }
}
