import 'package:flutter/material.dart';
import 'perpose_screen.dart';

class SexScreen extends StatefulWidget {
  const SexScreen({super.key});

  @override
  State<SexScreen> createState() => _SexScreenState();
}

class _SexScreenState extends State<SexScreen> {
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
            child: const Text(
              '次へ',
              style: TextStyle(color: Colors.green),
            ),
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
                const Expanded(
                  child: Column(
                    children: [
                      SizedBox(height: 100),
                      _Icon(),
                      SizedBox(height: 40),
                      _BodyText(),
                      SizedBox(height: 100),
                      _IconSelect(),
                    ],
                  ),
                ),
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
      Icons.badge,
      color: Colors.green,
      size: 70.0,
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
        SizedBox(height: 40),
        Text(
          '''
あなたのことを知れば、
正確なサポートをすることができます。''',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}

class _IconSelect extends StatefulWidget {
  const _IconSelect({super.key});

  @override
  State<_IconSelect> createState() => _IconSelectState();
}

class _IconSelectState extends State<_IconSelect> {
  String? _selectedGender;
  String male = 'male';
  String female = 'female';

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        OutlinedButton(
          onPressed: () {
            setState(() {
              _selectedGender = male;
            });
          },
          style: OutlinedButton.styleFrom(
            minimumSize: const Size(150, 150),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40.0)),
            backgroundColor:
            _selectedGender == male ? Colors.green : Colors.white,
            side: const BorderSide(color: Colors.green),
          ),
          child: Column(
            children: [
              Icon(
                Icons.male,
                color: _selectedGender == male ? Colors.white : Colors.green,
              ),
              Text(
                '男性',
                style: TextStyle(
                  color: _selectedGender == male ? Colors.white : Colors.green,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 40),
        OutlinedButton(
          onPressed: () {
            setState(() {
              _selectedGender = female;
            });
          },
          style: OutlinedButton.styleFrom(
            minimumSize: const Size(150, 150),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40)),
            backgroundColor:
            _selectedGender == female ? Colors.green : Colors.white,
            side: const BorderSide(color: Colors.green),
          ),
          child: Column(
            children: [
              Icon(
                Icons.female,
                color: _selectedGender == female ? Colors.white : Colors.green,
              ),
              Text(
                '女性',
                style: TextStyle(
                  color: _selectedGender == female ? Colors.white : Colors.green,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class _NextPageButton extends StatefulWidget {
  const _NextPageButton({super.key});

  @override
  State<_NextPageButton> createState() => _NextPageButtonState();
}

class _NextPageButtonState extends State<_NextPageButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          setState(() {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => const PerposeScreen()));
          });
        },
        child: const Text('次へ'),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green,
          foregroundColor: Colors.white,
        ));
  }
}