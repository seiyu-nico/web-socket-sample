// Flutter imports:
import 'package:flutter/material.dart';

class Progress extends StatefulWidget {
  final int progress;

  const Progress({Key? key, required this.progress}) : super(key: key);

  @override
  ProgressState createState() => ProgressState();
}

class ProgressState extends State<Progress> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 50.0, // 位置を調整
      right: 10.0,
      child: _buildProgressWidget(widget.progress),
    );
  }

  Widget _buildProgressWidget(int progress) {
    return Material(
      color: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
        decoration: BoxDecoration(
          color: Colors.black87,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Text(
          '$progress% 完了',
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
