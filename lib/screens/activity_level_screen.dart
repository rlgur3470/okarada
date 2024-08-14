import 'package:flutter/material.dart';
import 'package:weight_control/user_data_creator/User_Data_Creator.dart';

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
  String? state = '';

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
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _MainText(),
              _OptionButton(
                onFirstSelected: onFirstSelected,
                onSecondSelected: onSecondSelected,
                onThirdSelected: onThirdSelected,
                onFourthSelected: onFourthSelected,
                onFifthSelected: onFifthSelected,
                currentState: state ?? '',
                sedentary: sedentary,
                lightActivity: lightActivity,
                moderateActivity: moderateActivity,
                veryActive: veryActive,
                extremelyActive: extremelyActive,
                userGenderColor: userGenderColor,
              ),
            ],
          ),
        ),
      ),
    );
  }

  onFirstSelected(value) {
    setState(() {
      state = value;
      userValue = userValue.copyWith(activityLevel: state);
      Navigator.of(context).pushNamed(
        '/user-activity-level',
        arguments: userValue,
      );
      print(
          'nickname: ${userValue.nickname}, sex: ${userValue.sex}, age: ${userValue.age}, height: ${userValue.height}, weight: ${userValue.weight}, weightDifference: ${userValue.weightDiffrence}, activityLevel: ${userValue.activityLevel}');
    });
  }

  onSecondSelected(value) {
    setState(() {
      state = value;
      userValue = userValue.copyWith(activityLevel: state);
      Navigator.of(context).pushNamed(
        '/user-activity-level',
        arguments: userValue,
      );
      print(
          'nickname: ${userValue.nickname}, sex: ${userValue.sex}, age: ${userValue.age}, height: ${userValue.height}, weight: ${userValue.weight}, weightDifference: ${userValue.weightDiffrence}, activityLevel: ${userValue.activityLevel}');
    });
  }

  onThirdSelected(value) {
    setState(() {
      state = value;
      userValue = userValue.copyWith(activityLevel: state);
      Navigator.of(context).pushNamed(
        '/user-activity-level',
        arguments: userValue,
      );
      print(
          'nickname: ${userValue.nickname}, sex: ${userValue.sex}, age: ${userValue.age}, height: ${userValue.height}, weight: ${userValue.weight}, weightDifference: ${userValue.weightDiffrence}, activityLevel: ${userValue.activityLevel}');
    });
  }

  onFourthSelected(value) {
    setState(() {
      state = value;
      userValue = userValue.copyWith(activityLevel: state);
      Navigator.of(context).pushNamed(
        '/user-activity-level',
        arguments: userValue,
      );
      print(
          'nickname: ${userValue.nickname}, sex: ${userValue.sex}, age: ${userValue.age}, height: ${userValue.height}, weight: ${userValue.weight}, weightDifference: ${userValue.weightDiffrence}, activityLevel: ${userValue.activityLevel}');
    });
  }

  onFifthSelected(value) {
    setState(() {
      state = value;
      userValue = userValue.copyWith(activityLevel: state);
      Navigator.of(context).pushNamed(
        '/user-activity-level',
        arguments: userValue,
      );
      print(
          'nickname: ${userValue.nickname}, sex: ${userValue.sex}, age: ${userValue.age}, height: ${userValue.height}, weight: ${userValue.weight}, weightDifference: ${userValue.weightDiffrence}, activityLevel: ${userValue.activityLevel}');
    });
  }
}

class _MainText extends StatelessWidget {
  const _MainText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      '活動レベルを教えて下さい！',
      style: TextStyle(
        fontSize: 23,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      textAlign: TextAlign.center,
    );
  }
}

class _OptionButton extends StatelessWidget {
  final ValueChanged<String> onFirstSelected;
  final ValueChanged<String> onSecondSelected;
  final ValueChanged<String> onThirdSelected;
  final ValueChanged<String> onFourthSelected;
  final ValueChanged<String> onFifthSelected;
  final String currentState;
  final String sedentary;
  final String lightActivity;
  final String moderateActivity;
  final String veryActive;
  final String extremelyActive;
  final Color userGenderColor;

  const _OptionButton(
      {required this.onFirstSelected,
      required this.onSecondSelected,
      required this.onThirdSelected,
      required this.onFourthSelected,
      required this.onFifthSelected,
      required this.currentState,
      required this.sedentary,
      required this.lightActivity,
      required this.moderateActivity,
      required this.veryActive,
      required this.extremelyActive,
      required this.userGenderColor,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _ActivityLevelOption(
          label: 'ほとんど運動をしない',
          stateValue: sedentary,
          currentState: currentState,
          onSelected: onFirstSelected,
          userGenderColor: userGenderColor,
          buttonImage: 'asset/okarada_logo_image/okarada_logo.png',
        ),
        SizedBox(
          height: 10,
        ),
        _ActivityLevelOption(
          label: '週1~3日軽い運動',
          stateValue: lightActivity,
          currentState: currentState,
          onSelected: onSecondSelected,
          userGenderColor: userGenderColor,
          buttonImage: 'asset/okarada_logo_image/okarada_logo.png',
        ),
        SizedBox(
          height: 10,
        ),
        _ActivityLevelOption(
          label: '学生または一般事務職',
          stateValue: moderateActivity,
          currentState: currentState,
          onSelected: onThirdSelected,
          userGenderColor: userGenderColor,
          buttonImage: 'asset/okarada_logo_image/okarada_logo.png',
        ),
        SizedBox(
          height: 10,
        ),
        _ActivityLevelOption(
          label: '非常に活動的',
          stateValue: veryActive,
          currentState: currentState,
          onSelected: onFourthSelected,
          userGenderColor: userGenderColor,
          buttonImage: 'asset/okarada_logo_image/okarada_logo.png',
        ),
        SizedBox(
          height: 10,
        ),
        _ActivityLevelOption(
          label: '肉体労働または激しい運動',
          stateValue: extremelyActive,
          currentState: currentState,
          onSelected: onFifthSelected,
          userGenderColor: userGenderColor,
          buttonImage: 'asset/okarada_logo_image/okarada_logo.png',
        ),
      ],
    );
  }
}

class _ActivityLevelOption extends StatelessWidget {
  final String label;
  final String stateValue;
  final String? currentState;
  final ValueChanged<String> onSelected;
  final Color userGenderColor;
  final String buttonImage;

  const _ActivityLevelOption({
    required this.label,
    required this.stateValue,
    required this.currentState,
    required this.onSelected,
    required this.userGenderColor,
    required this.buttonImage,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        onSelected(stateValue);
      },
      style: OutlinedButton.styleFrom(
        minimumSize: Size(double.infinity, 60),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        backgroundColor:
            currentState == stateValue ? userGenderColor : Colors.white,
        side: BorderSide(
          color: userGenderColor,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset('$buttonImage',
              scale: 12,
              color:
                  currentState == stateValue ? Colors.white : userGenderColor),
          Text(
            label,
            style: TextStyle(
              color:
                  currentState == stateValue ? Colors.white : userGenderColor,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
