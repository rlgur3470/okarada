import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../component/app_bar_design.dart';
import 'user_weight_screen.dart'; // 다음 화면인 UserWeightScreen 임포트

class HeightInputScreen extends StatefulWidget {
  const HeightInputScreen({super.key});

  @override
  _HeightInputScreenState createState() => _HeightInputScreenState();
}

class _HeightInputScreenState extends State<HeightInputScreen> {
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
      resizeToAvoidBottomInset: false,
      appBar: _buildAppBar(context),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 16.0
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 100,
              ),
              _buildIcon(),
              SizedBox(
                height: 109,
              ),
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


  Widget _buildTitle() {
    return Align(
      alignment: Alignment.center,
      child: const Text(
        'あなたの身長は ?',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
      ),
    );
  }

  buttonOnPressed(){
    _isButtonEnabled ? setState(() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const UserWeightScreen(),
        ),
      );
    }) : null;
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
            Icon(
              Icons.accessibility_new_outlined,
              size: 100,
              color: Colors.green,
            ),
            Positioned(
              left: 65,
              child: Transform.rotate(
                angle: 3 * 3.14159 / 2,
                child: Icon(
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

  const _UserHeightInputField({
    required this.controller,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
        Align(
        alignment: Alignment.center,
        child: const Text(
          'あなたの身長は ?',
          style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),
        ),
      ),
          SizedBox(
            height: 120,
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
                    controller: controller,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 25),
                    maxLength: 3, // 최대 길이 6
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
                      hintStyle: TextStyle(
                          fontSize: 15,
                          height: 2
                      ),
                      counterText: '', // 글자 수 카운터 텍스트 제거
                    ),
                  ),
                ),
              ),
              Text(
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
  const _NextPageButton({
    required this.onPressed,
    required this.isButtonEnabled,
    super.key});

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



