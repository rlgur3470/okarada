import 'package:flutter/material.dart';
import 'package:weight_control/screens/height_input_screen.dart';
import 'package:weight_control/screens/user_weight_screen.dart';
import 'package:weight_control/screens/email_input_screen.dart';
import 'package:weight_control/screens/weight_input_screen.dart';
import 'package:weight_control/screens/pace_selection_screen.dart';
import 'package:weight_control/screens/approach_selection_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '체중 관리 앱',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HeightInputScreen(),
        '/user-weight': (context) => const UserWeightScreen(),
        '/email-input': (context) => const EmailInputScreen(),
        '/weight-input': (context) => const WeightInputScreen(),
        '/pace-selection': (context) => const PaceSelectionScreen(),
        '/approach-selection': (context) => const ApproachSelectionScreen(),
      },
    );
  }
}
