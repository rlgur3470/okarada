import 'package:flutter/material.dart';
import 'package:weight_control/user_data_creator/User_Data_Creator.dart';

import '../component/app_bar_design.dart';

class UserActivityLevelScreen extends StatefulWidget {
  const UserActivityLevelScreen({
    super.key,
  });

  @override
  State<UserActivityLevelScreen> createState() =>
      _UserActivityLevelScreenState();
}

class _UserActivityLevelScreenState extends State<UserActivityLevelScreen> {
  late UserValue userValue;
  late Color userGenderColor;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    userValue = ModalRoute.of(context)!.settings.arguments as UserValue;
    userGenderColor = userValue.userGenderColor!;
  }

  @override
  Widget build(BuildContext context) {
    double bmr = calculateBMR(userValue.sex!, userValue.weight!.toDouble(),
        userValue.age!, userValue.height!.toDouble());
    double tdee = calculateTDEE(bmr, userValue.activityLevel!);
    double daily = calculatedailyCalories1(
        bmr, userValue.activityLevel!, userValue.weightDiffrence!);

    return Scaffold(
      appBar: _buildAppBar(daily),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'ダイエット計画',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              _ResultBox(
                title: '基礎代謝量 (BMR)',
                value: '${bmr.toStringAsFixed(2)} kcal/day',
                userGenderColor: userGenderColor,
              ),
              _ResultBox(
                title: '1日の総エネルギー消費量 (TDEE)',
                value: '${tdee.toStringAsFixed(2)} kcal/day',
                userGenderColor: userGenderColor,
              ),
              _ResultBox(
                title: '目標体重のための1日の摂取量 (daily)',
                value: '${daily.toStringAsFixed(2)} kcal/day',
                userGenderColor: userGenderColor,
              ),
              ElevatedButton(
                onPressed: () => onNextPageButtonPressed(daily),
                style: ElevatedButton.styleFrom(
                  backgroundColor: userGenderColor,
                  foregroundColor: Colors.white,
                ),
                child: Text(
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

  AppBar _buildAppBar(double daily) {
    return AppBar(
      forceMaterialTransparency: true,
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios,
          color: userGenderColor,
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      title: ProgressBarStateStyle(
        progress: 0.8,
        color: userGenderColor,
      ),
      actions: [
        TextButton(
          onPressed: () => onNextPageButtonPressed(daily),
          child: TugiheButtonStyle(
            color: userGenderColor,
          ),
        )
      ],
    );
  }


  double calculateBMR(String gender, double weight, int age, double height) {
    switch (gender) {
      case 'male':
        return 88.362 + (13.397 * weight) + (4.799 * height) - (5.677 * age);
      case 'female':
        return 447.593 + (9.247 * weight) + (3.098 * height) - (4.330 * age);
      default:
        return 0.0; // 기본값 반환
    }
  }

  double calculateTDEE(double bmr, String activityLevel) {
    switch (activityLevel) {
      case 'sedentary':
        return bmr * 1.2;
      case 'lightActivity':
        return bmr * 1.375;
      case 'moderateActivity':
        return bmr * 1.55;
      case 'veryActive':
        return bmr * 1.725;
      case 'extremelyActive':
        return bmr * 1.9;
      default:
        return bmr * 1.2;
    }
  }

  double calculatedailyCalories1(
      double bmr, String activityLevel, int weightDifference) {
    switch (activityLevel) {
      case 'sedentary':
        return bmr * 1.2 - (weightDifference) * 7700 / 90;
      case 'lightActivity':
        return bmr * 1.375 - (weightDifference) * 7700 / 90;
      case 'moderateActivity':
        return bmr * 1.55 - (weightDifference) * 7700 / 90;
      case 'veryActive':
        return bmr * 1.725 - (weightDifference) * 7700 / 90;
      case 'extremelyActive':
        return bmr * 1.9 - (weightDifference) * 7700 / 90;
      default:
        return bmr * 1.2 - (weightDifference) * 7700 / 90;
    }
  }

  onNextPageButtonPressed(double daily) {
    int dailyKcal = daily.toInt();
    userValue = userValue.copyWith(dailyKcal: dailyKcal);

    setState(() {
      Navigator.of(context).pushNamed(
        '/food-recommendation',
        arguments: userValue,
      );
      print(
          'nickname: ${userValue.nickname}, sex: ${userValue.sex}, age: ${userValue.age}, height: ${userValue.height}, weight: ${userValue.weight}, weightDifference: ${userValue.weightDiffrence}, activityLevel: ${userValue.activityLevel}, dailyKcal: ${userValue.dailyKcal}');
    });
  }
}

class _ResultBox extends StatelessWidget {
  final Color userGenderColor;
  final String title;
  final String value;

  const _ResultBox({
    required this.userGenderColor,
    required this.title,
    required this.value,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 110,
          width: 12,
          decoration: BoxDecoration(
            color: userGenderColor,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 5,
                ),
              ],
            ),
            child: Column(
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: userGenderColor,
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          height: 110,
          width: 12,
          decoration: BoxDecoration(
            color: userGenderColor,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
