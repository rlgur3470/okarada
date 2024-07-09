import 'package:flutter/material.dart';
import '../component/app_bar_design.dart';
import 'package:weight_control/user_data_creator/User_Data_Creator.dart';

class SexScreen extends StatefulWidget {
  const SexScreen({super.key});

  @override
  State<SexScreen> createState() => _SexScreenState();
}

class _SexScreenState extends State<SexScreen> {
  String selectedGender = '';
  String male = 'male';
  String female = 'female';
  late UserValue userValue;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    userValue = ModalRoute.of(context)!.settings.arguments as UserValue;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).maybePop();
          },
        ),
        title: LinearProgressIndicator(
          value: 0.05,
          backgroundColor: Colors.grey[300],
          color: Colors.green,
          minHeight: 6.0,
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
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      SizedBox(height: 80),
                      _Icon(),
                      SizedBox(height: 40),
                      _BodyText(),
                      SizedBox(height: 100),
                      _IconSelect(
                        onMalePressed: onMaleButtonPressed,
                        onFemalePressed: onFemaleButtonPressed,
                        male: male,
                        female: female,
                        selectedGender: selectedGender,
                      ),
                    ],
                  ),
                ),
                _NextPageButton(
                  onPressed: onNextButtonPressed,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  onMaleButtonPressed() {
    setState(() {
      selectedGender = male;
    });
  }

  onFemaleButtonPressed() {
    setState(() {
      selectedGender = female;
    });
  }

  onNextButtonPressed() {
    setState(() {
      userValue = userValue.copyWith(sex: selectedGender);

      Navigator.of(context).pushNamed(
        '/birthday',
        arguments: userValue,
      );

      String? ads = userValue.sex;

      print('name: ${userValue.nickname}, sex: ${userValue.sex}');
    });
  }
}

class _Icon extends StatelessWidget {
  const _Icon({super.key});

  @override
  Widget build(BuildContext context) {
    return const Icon(
      Icons.badge,
      color: Colors.green,
      size: 100.0,
    );
  }
}

class _BodyText extends StatelessWidget {
  const _BodyText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Text(
          '''
まずはあなたのことを、
少しだけ教えてください。''',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        SizedBox(height: 20),
        Text(
          '''
あなたのことを知れば、
正確なサポートをすることができます。''',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18, color: Colors.grey),
        ),
      ],
    );
  }
}

class _IconSelect extends StatelessWidget {
  final VoidCallback onMalePressed;
  final VoidCallback onFemalePressed;
  final String male;
  final String female;
  final String selectedGender;

  const _IconSelect(
      {required this.onMalePressed,
        required this.onFemalePressed,
        required this.male,
        required this.female,
        required this.selectedGender,
        super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        OutlinedButton(
          onPressed: onMalePressed,
          style: OutlinedButton.styleFrom(
            minimumSize: const Size(150, 150),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40.0)),
            backgroundColor:
            selectedGender == male ? Colors.green : Colors.white,
            side: const BorderSide(color: Colors.green),
          ),
          child: Column(
            children: [
              Icon(
                Icons.male,
                color: selectedGender == male ? Colors.white : Colors.green,
              ),
              Text(
                '男性',
                style: TextStyle(
                  color: selectedGender == male ? Colors.white : Colors.green,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 40),
        OutlinedButton(
          onPressed: onFemalePressed,
          style: OutlinedButton.styleFrom(
            minimumSize: const Size(150, 150),
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
            backgroundColor:
            selectedGender == female ? Colors.green : Colors.white,
            side: const BorderSide(color: Colors.green),
          ),
          child: Column(
            children: [
              Icon(
                Icons.female,
                color: selectedGender == female ? Colors.white : Colors.green,
              ),
              Text(
                '女性',
                style: TextStyle(
                  color: selectedGender == female ? Colors.white : Colors.green,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class _NextPageButton extends StatelessWidget {
  final VoidCallback onPressed;
  const _NextPageButton({required this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: const Text(
        '次へ',
        style: TextStyle(fontSize: 18),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
    );
  }
}
