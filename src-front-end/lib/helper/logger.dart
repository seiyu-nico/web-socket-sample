// Package imports:
import 'package:logger/logger.dart';

final logger = Logger(
  printer: PrettyPrinter(
    printTime: true // Should each log print contain a timestamp
  ),
);
