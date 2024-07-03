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
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 5),
              Icon(Icons.monitor_weight,
              size: 100,
                color: Colors.green,
              ),
              const SizedBox(height: 50),
              const Text(
                textAlign: TextAlign.center,
                '''あなたの体重は?
大体でOKです。後でいつでも変更できます。''',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 70),
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
                        controller: _controller,
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
                          hintStyle: TextStyle(
                              fontSize: 18,
                              height: 1.8),
                          counterText: ''
                        ),
                      ),
                    ),
                  ),
                  const Text(
                    'kg',
                    style: TextStyle(fontSize: 24, color: Colors.grey),
                  ),
                ],
              ),
              ElevatedButton(
                  onPressed: _isButtonEnabled
                      ? () {
                    Navigator.pushNamed(context, '/email-input');
                  }
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  child: const Text(
                    '次へ',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
