import 'package:flutter/material.dart';
import 'nickname_screen.dart';
import 'package:weight_control/component/app_bar_design.dart';

class PerposeScreen extends StatefulWidget {
  const PerposeScreen({super.key});

  @override
  State<PerposeScreen> createState() => _PerposeScreenState();
}

class _PerposeScreenState extends State<PerposeScreen> {
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
          progress: 0.12,
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
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 20.0),
                const _TargetIcon(),
                const _WeightText(),
                const _SelectIcon(),
                _NextPageButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) =>
                        const NicknameScreen()));
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _TargetIcon extends StatelessWidget {
  const _TargetIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return const Icon(
      Icons.ads_click,
      color: Colors.green,
      size: 100.0,
    );
  }
}

class _WeightText extends StatelessWidget {
  const _WeightText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      textAlign: TextAlign.center,
      'あなたの目標は？',
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}

class _SelectIcon extends StatefulWidget {
  const _SelectIcon({super.key});

  @override
  State<_SelectIcon> createState() => _SelectIconState();
}

class _SelectIconState extends State<_SelectIcon> {
  final diet = 'diet';
  final makeBody = 'makebody';
  final healthCare = 'healthcare';
  final notIncluded = 'notincluded';
  String? state;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OutlinedButton(
              onPressed: () {
                setState(() {
                  state = diet;
                });
              },
              style: OutlinedButton.styleFrom(
                minimumSize: const Size(150, 150),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40)),
                backgroundColor:
                state == diet ? Colors.green : Colors.white,
                side: const BorderSide(color: Colors.green),
              ),
              child: Column(
                children: [
                  Icon(
                    Icons.monitor_weight,
                    size: 50,
                    color: state == diet ? Colors.white : Colors.green,
                  ),
                  Text(
                    'ダイエット',
                    style: TextStyle(
                        color:
                        state == diet ? Colors.white : Colors.green,
                        fontSize: 15,
                        fontWeight: FontWeight.w600
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 40.0,
            ),
            OutlinedButton(
              onPressed: () {
                setState(() {
                  state = makeBody;
                });
              },
              style: OutlinedButton.styleFrom(
                minimumSize: const Size(150, 150),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40)),
                backgroundColor:
                state == makeBody ? Colors.green : Colors.white,
                side: const BorderSide(color: Colors.green),
              ),
              child: Column(
                children: [
                  Icon(
                      Icons.settings_accessibility,
                      color:
                      state == makeBody ? Colors.white : Colors.green, size: 50
                  ),
                  Text(
                    'ボディメイク',
                    style: TextStyle(
                        color: state == makeBody
                            ? Colors.white
                            : Colors.green,
                        fontSize: 15,
                        fontWeight: FontWeight.w600
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 40.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OutlinedButton(
              onPressed: () {
                setState(() {
                  state = healthCare;
                });
              },
              style: OutlinedButton.styleFrom(
                minimumSize: const Size(150, 150),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40)),
                backgroundColor:
                state == healthCare ? Colors.green : Colors.white,
                side: const BorderSide(color: Colors.green),
              ),
              child: Column(
                children: [
                  Icon(
                      Icons.health_and_safety,
                      color: state == healthCare
                          ? Colors.white
                          : Colors.green,
                      size: 50
                  ),
                  Text(
                    '健康管理',
                    style: TextStyle(
                        color: state == healthCare
                            ? Colors.white
                            : Colors.green,
                        fontSize: 16,
                        fontWeight: FontWeight.w400
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 40.0,
            ),
            OutlinedButton(
              onPressed: () {
                setState(() {
                  state = notIncluded;
                });
              },
              style: OutlinedButton.styleFrom(
                minimumSize: const Size(150, 150),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40)),
                backgroundColor:
                state == notIncluded ? Colors.green : Colors.white,
                side: const BorderSide(color: Colors.green),
              ),
              child: Column(
                children: [
                  Icon(
                      Icons.interests,
                      color: state == notIncluded
                          ? Colors.white
                          : Colors.green,
                      size: 50
                  ),
                  Text(
                    'その他',
                    style: TextStyle(
                        color: state == notIncluded
                            ? Colors.white
                            : Colors.green,
                        fontSize: 16,
                        fontWeight: FontWeight.w400
                    ),
                  ),
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}

class _NextPageButton extends StatelessWidget {
  final VoidCallback onPressed;
  const _NextPageButton({
    required this.onPressed,
    super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        child: const Text(
          '次へ',
          style: TextStyle(
            fontSize: 18
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green,
          foregroundColor: Colors.white,
        ));
  }
}
