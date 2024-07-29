import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weight_control/user_data_creator/User_Data_Creator.dart';
import '../component/app_bar_design.dart';

class HeightInputScreen extends StatefulWidget {
  const HeightInputScreen({super.key});

  @override
  _HeightInputScreenState createState() => _HeightInputScreenState();
}

class _HeightInputScreenState extends State<HeightInputScreen> {
  final TextEditingController _controller = TextEditingController();
  bool _isButtonEnabled = false;

  late UserValue userValue;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    userValue = ModalRoute.of(context)!.settings.arguments as UserValue;
  }

  @override
  void initState() {
    super.initState();
    _controller.addListener(_checkButtonState);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _checkButtonState() {
    setState(() {
      _isButtonEnabled = _controller.text.isNotEmpty;
      if (_controller.text.length == 3) {
        FocusScope.of(context).unfocus(); // 키보드를 내림
      }
    });
  }

  void buttonOnPressed() {
    if (_isButtonEnabled) {
      int userCurrentHeight = int.parse(_controller.text);
      userValue = userValue.copyWith(height: userCurrentHeight);
      Navigator.of(context).pushNamed(
        '/user-weight',
        arguments: userValue,
      );
      print('nickname: ${userValue.nickname}, sex: ${userValue.sex}, age: ${userValue.age}, height: ${userValue.height}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: _buildAppBar(context),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 100),
              const _buildIcon(),
              const SizedBox(height: 109),
              _UserHeightInputField(controller: _controller),
              _NextPageButton(
                onPressed: buttonOnPressed,
                isButtonEnabled: _isButtonEnabled,
              )
            ],
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      title: ProgressBarStateStyle(
        progress: 0.37,
      ),
      actions: [
        TextButton(
          onPressed: () {},
          child: const TugiheButtonStyle(),
        )
      ],
    );
  }
}

class _buildIcon extends StatelessWidget {
  const _buildIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        width: 165.5,
        child: Stack(
          children: [
            const Icon(
              Icons.accessibility_new_outlined,
              size: 100,
              color: Colors.green,
            ),
            Positioned(
              left: 65,
              child: Transform.rotate(
                angle: 3 * 3.14159 / 2,
                child: const Icon(
                  Icons.straighten,
                  size: 100.0,
                  color: Colors.green,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _UserHeightInputField extends StatelessWidget {
  final TextEditingController controller;

  const _UserHeightInputField({required this.controller, super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          const Align(
            alignment: Alignment.center,
            child: Text(
              'あなたの身長は ?',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(height: 120),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Container(
                  width: 100,
                  height: 30,
                  child: TextField(
                    cursorColor: Colors.green,
                    controller: controller,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 25),
                    maxLength: 3, // 최대 길이 3
                    showCursor: true,
                    cursorHeight: 20,
                    decoration: const InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.green,
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.green, width: 2),
                      ),
                      hintText: '3桁で',
                      hintStyle: TextStyle(fontSize: 15, height: 2),
                      counterText: '', // 글자 수 카운터 텍스트 제거
                    ),
                  ),
                ),
              ),
              const Text(
                'cm',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 25,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _NextPageButton extends StatelessWidget {
  final VoidCallback onPressed;
  final bool isButtonEnabled;
  const _NextPageButton(
      {required this.onPressed, required this.isButtonEnabled, super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: isButtonEnabled ? Colors.green : Colors.grey,
      ),
      child: const Text(
        '次へ',
        style: TextStyle(fontSize: 18, color: Colors.white),
      ),
    );
  }
}
