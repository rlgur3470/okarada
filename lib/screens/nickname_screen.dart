import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'birthday_screen.dart';
import 'package:weight_control/component/app_bar_design.dart';
import 'package:flutter/services.dart';

class NicknameScreen extends StatefulWidget {
  const NicknameScreen({super.key});

  @override
  State<NicknameScreen> createState() => _NicknameScreenState();
}

class _NicknameScreenState extends State<NicknameScreen> {
  final TextEditingController _controller = TextEditingController();

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
          progress: 0.24,
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: const TugiheButtonStyle(),
          )
        ],
      ),
      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                const SizedBox(height: 100),
                const _Icon(),
                const SizedBox(height: 50),
                Expanded(
                  child: _TextInput(controller: _controller),
                ),
                _NextPageButton(controller: _controller),
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
      Icons.verified,
      color: Colors.green,
      size: 100,
    );
  }
}

class _TextInput extends StatelessWidget {
  final TextEditingController controller;

  const _TextInput({required this.controller, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 220,
      height: 100,
      child: Column(
        children: [
          const Text(
            'あなたのニックネームは？',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 50),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Container(
                      height: 30,
                      width: 150,
                      child: TextField(
                        textAlign: TextAlign.center,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(10),
                        ],
                        cursorColor: Colors.green,
                        cursorHeight: 23,
                        controller: controller,
                        decoration: const InputDecoration(
                          hintText: '15文字以内',
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green, width: 2)
                          ),
                        ),
                        style: TextStyle(fontSize: 25),

                      ),
                    ),
                  ),
                  Text(
                    '様',
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
  final TextEditingController controller;

  const _NextPageButton({required this.controller, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ElevatedButton(
          onPressed: () {
            if (controller.text.isNotEmpty) {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (BuildContext context) {
                  return const BirthdayScreen();
                }),
              );
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            foregroundColor: Colors.white,
          ),
          child: const Text(
            '次へ',
          ),
        ),
      ],
    );
  }
}
