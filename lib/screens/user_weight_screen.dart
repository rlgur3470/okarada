import 'package:flutter/material.dart';
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
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(3.0),
                child: LinearProgressIndicator(
                  value: 0.33,
                  backgroundColor: Colors.grey[300],
                  color: Colors.green,
                  minHeight: 6.0,
                ),
              ),
            ),
            const SizedBox(width: 16),
            const Text(
              '次へ',
              style: TextStyle(fontSize: 16, color: Colors.lightGreen),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 40),
            Icon(Icons.monitor_weight,
            size: 100,
              color: Colors.green,
            ),
            const SizedBox(height: 50),
            const Text(
              'あなたの体重は ?',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            const Text(
              '大体でOKです。　後でいつでも変更できます。',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 70),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 100,
                  child: TextField(
                    cursorColor: Colors.lightGreen,
                    controller: _controller,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 48),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: '',
                      hintStyle: TextStyle(color: Colors.green),
                    ),
                  ),
                ),
                const Text(
                  'kg',
                  style: TextStyle(fontSize: 24, color: Colors.grey),
                ),
              ],
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: ElevatedButton(
                onPressed: _isButtonEnabled
                    ? () {
                  Navigator.pushNamed(context, '/email-input');
                }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightGreen,
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text(
                  '次へ',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
