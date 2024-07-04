import 'package:flutter/material.dart';
import '../component/app_bar_design.dart';
import 'email_input_screen.dart';

class UserWeightScreen extends StatefulWidget {
  const UserWeightScreen({super.key});

  @override
  _UserWeightScreenState createState() => _UserWeightScreenState();
}

class _UserWeightScreenState extends State<UserWeightScreen> {
  final TextEditingController _controller = TextEditingController();
  bool _isButtonEnabled = false;

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
          progress: 0.44,
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 100),
              Icon(
                Icons.monitor_weight,
                size: 100,
                color: Colors.green,
              ),
              SizedBox(height: 100),
              _WeightInputText(controller: _controller),
              _NextPageButton(onPressed: moveToNextPage, isButtonEnabled: _isButtonEnabled)
            ],
          ),
        ),
      ),
    );
  }

  moveToNextPage(){
    _isButtonEnabled
        ? setState(() {
      Navigator.pushNamed(context, '/email-input');
        })
        : null;
  }
}

class _WeightInputText extends StatelessWidget {
  final TextEditingController controller;
  const _WeightInputText({required this.controller, super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Text(
            textAlign: TextAlign.center,
            'あなたの体重は?',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            textAlign: TextAlign.center,
            '大体でもOKです。後でいつでも変更できます。',
            style: TextStyle(fontSize: 18, color: Colors.grey),
          ),
          SizedBox(
            height: 95,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 15),
                child: Container(
                  width: 100,
                  height: 30,
                  child: TextField(
                    cursorColor: Colors.green,
                    cursorHeight: 20,
                    maxLength: 3,
                    controller: controller,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 25),
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
                        hintText: '3桁以内に',
                        hintStyle: TextStyle(fontSize: 15, height: 2),
                        counterText: ''),
                  ),
                ),
              ),
              const Text(
                'kg',
                style: TextStyle(fontSize: 24, color: Colors.grey),
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
  const _NextPageButton({
    required this.onPressed,
    required this.isButtonEnabled,
    super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: isButtonEnabled ? Colors.green : Colors.grey[300],
      ),
      child: const Text(
        '次へ',
        style: TextStyle(fontSize: 18, color: Colors.white),
      ),
    );
  }
}

