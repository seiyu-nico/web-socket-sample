// Project imports:
import 'package:websocket_sample/entities/csv_row.dart';

class Csv {
  final List<CsvRow> rows;

  Csv(List rawData) : rows = rawData.map((row) => CsvRow(row)).toList();

  // List<List<dynamic>>へキャスト
  List<List<dynamic>> toList() => rows.map((row) => row.values).toList();
}
