import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weight_control/component/app_bar_design.dart';

class BirthdayScreen extends StatefulWidget {
  const BirthdayScreen({super.key});

  @override
  State<BirthdayScreen> createState() => _BirthdayScreenState();
}

class _BirthdayScreenState extends State<BirthdayScreen> {
  DateTime selectedDate = DateTime(2000, 01, 01);

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
          progress: 0.36,
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
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 100),
                const _Icon(),
                SizedBox(height: 100),
                const _BirthdayText(),
                const SizedBox(height: 50),

                _BirthdayPicker(
                    selectedDate: selectedDate,
                    onDateSelected: (date) {
                      setState(() {
                        selectedDate = date;
                      });
                    }),
                const _NextPageButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Icon extends StatelessWidget {
  const _Icon({super.key});

  @override
  Widget build(BuildContext context) {
    return const Icon(
      Icons.cake,
      color: Colors.green,
      size: 100.0,
    );
  }
}

class _BirthdayText extends StatelessWidget {
  const _BirthdayText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'あなたの生年月日は？',
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}

class _BirthdayPicker extends StatelessWidget {
  final DateTime selectedDate;
  final ValueChanged<DateTime> onDateSelected;

  const _BirthdayPicker(
      {required this.selectedDate, required this.onDateSelected, super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Text(
            '${selectedDate.year}.${selectedDate.month}.${selectedDate.day}',
            style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.w600,
                color: Colors.green),
          ),
          SizedBox(
            height: 100,
          ),
          CupertinoButton(
            child: const Text(
              '誕生日を選択する',
              style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.w600,
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
                          child: const Text(
                            '選択する',
                            style: TextStyle(color: Colors.green),
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
      ),
    );
  }
}

class _NextPageButton extends StatelessWidget {
  const _NextPageButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/height-input');
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            foregroundColor: Colors.white,
          ),
          child: const Text(
            '次へ',
            style: TextStyle(fontSize: 18),
          ),
        ),
      ],
    );
  }
}
