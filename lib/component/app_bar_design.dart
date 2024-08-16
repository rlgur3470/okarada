import 'package:flutter/material.dart';
import 'package:weight_control/component/okarada_color.dart';

class ProgressBarStateStyle extends StatelessWidget {
  final Color color;
  final double progress;
  const ProgressBarStateStyle({
    required this.progress,
    required this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      value: progress,
      backgroundColor: Colors.grey[300],
      color: color,
      minHeight: 6.0,
    );
  }
}

class TugiheButtonStyle extends StatelessWidget {
  final Color color;
  const TugiheButtonStyle({
    required this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      '次へ',
      style: TextStyle(
        color: color,
      ),
    );
  }
}
