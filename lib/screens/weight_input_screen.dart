

import 'package:flutter/material.dart';
import 'package:weight_control/user_data_creator/User_Data_Creator.dart';
import '../component/app_bar_design.dart';

class WeightInputScreen extends StatefulWidget {
  const WeightInputScreen({super.key});

  @override
  State<WeightInputScreen> createState() => _WeightInputScreenState();
}

class _WeightInputScreenState extends State<WeightInputScreen> {
  final int initialWeight = 0;
  final TextEditingController _currentWeightController =
  TextEditingController();
  final TextEditingController _goalWeightController = TextEditingController();
  bool _isCurrentButtonEnabled = false;
  bool _isGoalButtonEnabled = false;
  late UserValue userValue;

  @override
  void initState() {
    super.initState();
    _goalWeightController.addListener(_checkGoalButtonState);
    _currentWeightController.addListener(_checkCurrentButtonState);
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    userValue = ModalRoute.of(context)!.settings.arguments as UserValue;
    _currentWeightController.text = userValue.weight.toString();
  }

  @override
  void dispose() {
    _currentWeightController.dispose();
    _goalWeightController.dispose();
    super.dispose();
  }

  void _checkCurrentButtonState() {
    setState(() {
      _isCurrentButtonEnabled = _currentWeightController.text.isNotEmpty;
    });
  }

  void _checkGoalButtonState() {
    setState(() {
      _isGoalButtonEnabled = _goalWeightController.text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: ProgressBarStateStyle(
          progress: 0.63,
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: const TugiheButtonStyle(),
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
          ),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 100),
                _IconField(),
                const SizedBox(height: 50),
                _TextField(),
                const SizedBox(height: 24),
                _WeightChange(
                    currentController: _currentWeightController,
                    goalWeightController: _goalWeightController),
                SizedBox(
                  height: 70,
                ),
                _NextPagebutton(
                  onPressed: onNextButtonPressed,
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                    _isCurrentButtonEnabled && _isGoalButtonEnabled
                        ? Colors.green
                        : Colors.grey[300],
                    foregroundColor: Colors.white,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  onNextButtonPressed() {
    _isCurrentButtonEnabled && _isGoalButtonEnabled
        ? setState(() {
      int weightDifference = int.parse(_currentWeightController.text) - int.parse(_goalWeightController.text);
      userValue = userValue.copyWith(weightDiffrence: weightDifference);
      Navigator.pushNamed(context, '/activity-level',
        arguments: userValue,
      );
      print('nickname: ${userValue.nickname}, sex: ${userValue.sex}, age: ${userValue.age}, height: ${userValue.height}, weight: ${userValue.weight}, weightDifference: ${userValue.weightDiffrence}');
    })
        : null;
  }
}

class _IconField extends StatelessWidget {
  const _IconField({super.key});

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.bar_chart,
      size: 100,
      color: Colors.green,
    );
  }
}

class _TextField extends StatelessWidget {
  const _TextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.center,
          child: const Text(
            'あなたの目標体重は?',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(height: 8),
        Align(
          alignment: Alignment.center,
          child: const Text(
            '最初は、２ヶ月後を目標にします。',
            style: TextStyle(fontSize: 18, color: Colors.grey),
          ),
        ),
      ],
    );
  }
}

class _WeightChange extends StatelessWidget {
  final TextEditingController currentController;
  final TextEditingController goalWeightController;
  const _WeightChange(
      {required this.currentController,
        required this.goalWeightController,
        super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: Container(
            width: 150,
            height: 30,
            child: TextField(
              cursorColor: Colors.green,
              cursorHeight: 20,
              maxLength: 3,
              controller: currentController,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 24),
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.green,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.green, width: 2),
                  ),
                  border: InputBorder.none,
                  suffixStyle: TextStyle(fontSize: 24),
                  hintText: '今の体重',
                  hintStyle: TextStyle(fontSize: 15, height: 2),
                  counterText: ''),
            ),
          ),
        ),
        Text(
          'KG',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
        ),
        const SizedBox(width: 10),
        const Icon(Icons.arrow_forward, size: 36),
        const SizedBox(width: 10),
        Flexible(
          child: Container(
            width: 150,
            height: 30,
            child: TextField(
              cursorColor: Colors.green,
              cursorHeight: 20,
              maxLength: 3,
              controller: goalWeightController,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 24),
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.green,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.green, width: 2),
                  ),
                  border: InputBorder.none,
                  hintText: '目指せる体重',
                  hintStyle: TextStyle(fontSize: 15, height: 2),
                  counterText: ''),
            ),
          ),
        ),
        Text(
          'KG',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}

class _NextPagebutton extends StatelessWidget {
  final VoidCallback onPressed;
  final ButtonStyle style;
  const _NextPagebutton(
      {required this.onPressed, required this.style, super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: style,
      child: const Text(
        '次へ',
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}
