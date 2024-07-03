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
      appBar: _buildAppBar(context),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(height: 40),
            _buildIcon(),
            const SizedBox(height: 50),
            _buildTitle(),
            const SizedBox(height: 70),
            _buildHeightInput(),
            const SizedBox(height: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildNextButton(context),
              ],
            )
          ],
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

  Widget _buildIcon() {
    return Container(
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
    );
  }

  Widget _buildTitle() {
    return const Text(
      'あなたの身長は ?',
      style: TextStyle(fontSize: 18, color: Colors.grey),
    );
  }

  Widget _buildHeightInput() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 35),
            child: Container(
              width: 100,
              height: 30,
              child: TextField(
                cursorColor: Colors.green,
                controller: _controller,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 25),
                maxLength: 6, // 최대 길이 6
                showCursor: true,
                cursorHeight: 24,
                decoration: const InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.green,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.green, width: 2),
                  ),
                  hintText: '',
                  hintStyle: TextStyle(color: Colors.green),
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
      );
  }

  Widget _buildUnderline() {
    return Container(
      width: 100,
      height: 2,
      color: Colors.green, // 녹색 선 색상
    );
  }

  Widget _buildNextButton(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        // 연두색 배경 설정
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: ElevatedButton(
        onPressed: _isButtonEnabled
            ? () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const UserWeightScreen(),
                  ),
                );
              }
            : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: _isButtonEnabled ? Colors.green : Colors.grey,
        ),
        child: const Text(
          '次へ',
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
      ),
    );
  }
}
