import 'package:flutter/material.dart';

import '../component/app_bar_design.dart';

class ApproachSelectionScreen extends StatefulWidget {
  const ApproachSelectionScreen({super.key});

  @override
  State<ApproachSelectionScreen> createState() => _ApproachSelectionScreenState();
}

class _ApproachSelectionScreenState extends State<ApproachSelectionScreen> {
  String selectedMethod = "balanced";

  Map<String, int> calorieIntake = {
    "diet": 2000,
    "balanced": 2461,
    "exercise": 2700,
  };

  Map<String, int> calorieBurn = {
    "diet": 300,
    "balanced": 379,
    "exercise": 500,
  };

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
          progress: 0.96,
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
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 24),
              const Icon(
                Icons.place,
                size: 100,
                color: Colors.green,
              ),
              const SizedBox(height: 24),
              const Text(
                '減量へのアプローチ方法はgsadadsa？',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedMethod = "diet";
                  });
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  width: double.infinity,
                  height: 80,
                  decoration: BoxDecoration(
                    color: selectedMethod == "diet" ? Colors.green[100] : Colors.white,
                    borderRadius: BorderRadius.circular(30.0),
                    border: Border.all(
                      color: Colors.green,
                      width: selectedMethod == "diet" ? 2 : 1,
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      '食事中心',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedMethod = "balanced";
                  });
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  width: double.infinity,
                  height: 80,
                  decoration: BoxDecoration(
                    color: selectedMethod == "balanced" ? Colors.green[100] : Colors.white,
                    borderRadius: BorderRadius.circular(30.0),
                    border: Border.all(
                      color: Colors.green,
                      width: selectedMethod == "balanced" ? 2 : 1,
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      '食事と運動バランスよく',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedMethod = "exercise";
                  });
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  width: double.infinity,
                  height: 80,
                  decoration: BoxDecoration(
                    color: selectedMethod == "exercise" ? Colors.green[100] : Colors.white,
                    borderRadius: BorderRadius.circular(30.0),
                    border: Border.all(
                      color: Colors.green,
                      width: selectedMethod == "exercise" ? 2 : 1,
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      '運動中心',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      const Icon(Icons.restaurant, color: Colors.green),
                      const SizedBox(height: 8),
                      const Text(
                        '目標摂取カロリー',
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '${calorieIntake[selectedMethod]} kcal',
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.teal),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const Icon(Icons.local_fire_department, color: Colors.green),
                      const SizedBox(height: 8),
                      const Text(
                        '目標消費カロリー',
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '${calorieBurn[selectedMethod]} kcal',
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.teal),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  // 다음 단계로 이동하는 로직 추가
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  minimumSize: const Size.fromHeight(50), // 버튼 높이 설정
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0), // 버튼 모서리 둥글게
                  ),
                ),
                child: const Text(
                  '次へ',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
