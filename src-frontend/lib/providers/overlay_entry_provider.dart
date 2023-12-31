// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

final progressProvider = StateProvider<int>((ref) => 0);

final overlayEntryProvider = StateProvider<OverlayEntry?>((ref) => null);
