import 'package:flutter/material.dart';

class ActivityLevelScreen extends StatefulWidget {
  const ActivityLevelScreen({super.key});

  @override
  State<ActivityLevelScreen> createState() => _ActivityLevelScreenState();
}

class _ActivityLevelScreenState extends State<ActivityLevelScreen> {
  final sedentary = 'sedentary';
  final lightActivity = 'lightActivity';
  final moderateActivity = 'moderateActivity';
  final veryActive = 'veryActive';
  final extremelyActive = 'extremelyActive';
  String? state;

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
        title: LinearProgressIndicator(
          value: 0.75,
          backgroundColor: Colors.grey[300],
          color: Colors.green,
          minHeight: 6.0,
        ),
        actions: [
          TextButton(
            onPressed: state != null
                ? () {
                    // 다음 페이지로 이동하는 로직 추가
                  }
                : null,
            child: Text(
              '次へ',
              style: TextStyle(
                color: state != null ? Colors.green : Colors.grey,
              ),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 50,
              ),
              Expanded(
                child: Column(
                  children: [
                    const Icon(
                      Icons.run_circle_outlined,
                      size: 100,
                      color: Colors.green,
                    ),
                    const SizedBox(height: 20.0),
                    const Text(
                      'あなたの活動レベルは？',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 40.0),
                    _ActivityLevelOption(
                      label: 'ほとんど運動をしない',
                      stateValue: sedentary,
                      currentState: state,
                      onSelected: (value) {
                        setState(() {
                          state = value;
                        });
                      },
                    ),
                    const SizedBox(height: 10.0),
                    _ActivityLevelOption(
                      label: '週1~3日軽い運動',
                      stateValue: lightActivity,
                      currentState: state,
                      onSelected: (value) {
                        setState(() {
                          state = value;
                        });
                      },
                    ),
                    const SizedBox(height: 10.0),
                    _ActivityLevelOption(
                      label: '学生または一般事務職',
                      stateValue: moderateActivity,
                      currentState: state,
                      onSelected: (value) {
                        setState(() {
                          state = value;
                        });
                      },
                    ),
                    const SizedBox(height: 10.0),
                    _ActivityLevelOption(
                      label: '非常に活動的',
                      stateValue: veryActive,
                      currentState: state,
                      onSelected: (value) {
                        setState(() {
                          state = value;
                        });
                      },
                    ),
                    const SizedBox(height: 10.0),
                    _ActivityLevelOption(
                      label: '肉体労働または激しい運動',
                      stateValue: extremelyActive,
                      currentState: state,
                      onSelected: (value) {
                        setState(() {
                          state = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: state != null
                    ? () {
                        // 다음 페이지로 이동하는 로직 추가
                      }
                    : null,
                child: const Text('次へ'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  disabledBackgroundColor: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ActivityLevelOption extends StatelessWidget {
  final String label;
  final String stateValue;
  final String? currentState;
  final ValueChanged<String> onSelected;

  const _ActivityLevelOption({
    required this.label,
    required this.stateValue,
    required this.currentState,
    required this.onSelected,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        onSelected(stateValue);
      },
      style: OutlinedButton.styleFrom(
        minimumSize: const Size(double.infinity, 70),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        backgroundColor:
            currentState == stateValue ? Colors.green : Colors.white,
        side: const BorderSide(color: Colors.green),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: currentState == stateValue ? Colors.white : Colors.green,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
