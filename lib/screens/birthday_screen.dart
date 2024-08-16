import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weight_control/component/app_bar_design.dart';
import 'package:weight_control/user_data_creator/User_Data_Creator.dart';

class BirthdayScreen extends StatefulWidget {
  const BirthdayScreen({super.key});

  @override
  State<BirthdayScreen> createState() => _BirthdayScreenState();
}

class _BirthdayScreenState extends State<BirthdayScreen> {
  DateTime selectedDate = DateTime(2000, 01, 01);
  late UserValue userValue;
  late Color userGenderColor;
  late String userNick;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    userValue = ModalRoute.of(context)!.settings.arguments as UserValue;
    userGenderColor = userValue.userGenderColor!;
    userNick = userValue.nickname!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _BuildAppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  height: 10,
                ),
                _BirthdayText(
                  userNick: userNick,
                  userGenderColor: userGenderColor,
                ),
                Column(
                  children: [
                    _Icon(
                      userGenderColor: userGenderColor,
                    ),
                    _BirthdayPicker(
                        selectedDate: selectedDate,
                        userGenderColor: userGenderColor,
                        onDateSelected: (date) {
                          setState(() {
                            selectedDate = date;
                          });
                        }),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                _NextPageButton(
                  backButtonColor: userGenderColor,
                  foreButtonColor: Colors.black,
                  onPressed: NextPageButtonPressed,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  AppBar _BuildAppBar(){
    return AppBar(
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios,
          color: userGenderColor,
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      title: ProgressBarStateStyle(
        progress: 0.3,
        color: userGenderColor,
      ),
      actions: [
        TextButton(
          onPressed: NextPageButtonPressed,
          child: TugiheButtonStyle(
            color: userGenderColor,
          ),
        )
      ],
    );
  }

  int calculateAge(DateTime birthDate) {
    DateTime currentDate = DateTime.now();
    int age = currentDate.year - birthDate.year;
    int month1 = currentDate.month;
    int month2 = birthDate.month;

    if (month2 > month1) {
      age--;
    } else if (month1 == month2) {
      int day1 = currentDate.day;
      int day2 = birthDate.day;
      if (day2 > day1) {
        age--;
      }
    }
    return age;
  }

  NextPageButtonPressed() {
    int myAge = calculateAge(selectedDate);
    userValue = userValue.copyWith(age: myAge);
    setState(() {
      Navigator.pushNamed(
        context,
        '/height-input',
        arguments: userValue,
      );

      print(
          'nickname: ${userValue.nickname}, sex: ${userValue.sex}, age: ${userValue.age}');
    });
  }
}

class _Icon extends StatelessWidget {
  final Color userGenderColor;
  const _Icon({
    required this.userGenderColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.cake,
      color: userGenderColor,
      size: 80,
    );
  }
}

class _BirthdayText extends StatelessWidget {
  final String userNick;
  final Color userGenderColor;
  const _BirthdayText({
    required this.userNick,
    required this.userGenderColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(width: 3, color: userGenderColor))),
              child: Text(
                "$userNick",
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w600,
                  color: userGenderColor,
                ),
              ),
            ),
            Text(
              " 様の",
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        Text(
          "誕生日を教えて下さい！",
          style: TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

class _BirthdayPicker extends StatelessWidget {
  final DateTime selectedDate;
  final ValueChanged<DateTime> onDateSelected;
  final Color userGenderColor;

  const _BirthdayPicker({
    required this.selectedDate,
    required this.onDateSelected,
    required this.userGenderColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: userGenderColor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${selectedDate.year}年${selectedDate.month}月${selectedDate.day}日',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 50,
        ),
        CupertinoButton(
          child: Container(
            height: 45,
            width: 200,
            decoration: BoxDecoration(
                border: Border.all(color: userGenderColor, width: 3),
                borderRadius: BorderRadius.circular(10)),
            child: Text(
              '誕生日を選択する',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: userGenderColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 25),
            ),
          ),
          onPressed: () {
            showCupertinoModalPopup(
              context: context,
              builder: (BuildContext context) {
                return Container(
                  height: 300,
                  color: Colors.white,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 200,
                        child: CupertinoDatePicker(
                          initialDateTime: selectedDate,
                          mode: CupertinoDatePickerMode.date,
                          dateOrder: DatePickerDateOrder.ymd,
                          onDateTimeChanged: (DateTime date) {
                            onDateSelected(date);
                          },
                          maximumDate: DateTime.now(),
                        ),
                      ),
                      CupertinoButton(
                        child: Text(
                          '選択する',
                          style: TextStyle(
                              color: userGenderColor,
                              fontSize: 20,
                              fontWeight: FontWeight.w600),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ],
    );
  }
}

class _NextPageButton extends StatelessWidget {
  final Color foreButtonColor;
  final Color backButtonColor;
  final VoidCallback onPressed;
  const _NextPageButton(
      {required this.foreButtonColor,
      required this.backButtonColor,
      required this.onPressed,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: backButtonColor,
            foregroundColor: foreButtonColor,
          ),
          child: const Text(
            '次へ',
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
