class CsvRow {
  final List<String> values;

  CsvRow(List<dynamic> data) : values = data.map((e) => e.toString()).toList();
}
