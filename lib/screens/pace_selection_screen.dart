import 'package:flutter/material.dart';

class PaceSelectionScreen extends StatefulWidget {
  const PaceSelectionScreen({super.key});

  @override
  State<PaceSelectionScreen> createState() => _PaceSelectionScreenState();
}

class _PaceSelectionScreenState extends State<PaceSelectionScreen> {
  bool isRecommendedSelected = true;

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
        title: LinearProgressIndicator(
          value: 0.66,
          backgroundColor: Colors.grey[300],
          color: Colors.green,
          minHeight: 6.0,
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/approach-selection');
            },
            child: const Text(
              '次へ',
              style: TextStyle(
                color: Colors.green,
                fontSize: 16.0,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 24),
            const Icon(
              Icons.access_time,
              size: 100,
              color: Colors.green,
            ),
            const SizedBox(height: 24),
            const Text(
              'どれくらいのペースでなりたい姿を目指しますか？',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            GestureDetector(
              onTap: () {
                setState(() {
                  isRecommendedSelected = true;
                });
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 16),
                margin: const EdgeInsets.symmetric(vertical: 8),
                width: double.infinity,
                height: 82,
                decoration: BoxDecoration(
                  color:
                      isRecommendedSelected ? Colors.green[100] : Colors.white,
                  borderRadius: BorderRadius.circular(30.0),
                  border: Border.all(
                    color: Colors.green,
                    width: isRecommendedSelected ? 2 : 1,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'おすすめ',
                      style: TextStyle(color: Colors.green, fontSize: 14),
                    ),
                    SizedBox(height: 4),
                    Text(
                      '1ヶ月で1.3kg減量ペース',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  isRecommendedSelected = false;
                });
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 16),
                margin: const EdgeInsets.symmetric(vertical: 8),
                width: double.infinity,
                height: 80,
                decoration: BoxDecoration(
                  color:
                      !isRecommendedSelected ? Colors.green[100] : Colors.white,
                  borderRadius: BorderRadius.circular(30.0),
                  border: Border.all(
                    color: Colors.green,
                    width: !isRecommendedSelected ? 2 : 1,
                  ),
                ),
                child: const Center(
                  child: Text(
                    '1ヶ月で2.4kg減量ペース',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.calendar_today, color: Colors.green),
                const SizedBox(width: 8),
                RichText(
                  text: TextSpan(
                    style: const TextStyle(
                      color: Colors.teal,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                          text: '${calculateTargetDate().split(' ')[0]}',
                          style: const TextStyle(
                              fontSize: 24, color: Colors.teal)),
                      TextSpan(
                          text: '年 ',
                          style: const TextStyle(
                              fontSize: 16, color: Colors.black)),
                      TextSpan(
                          text: '${calculateTargetDate().split(' ')[1]}',
                          style: const TextStyle(
                              fontSize: 24, color: Colors.teal)),
                      TextSpan(
                          text: '月 ',
                          style: const TextStyle(
                              fontSize: 16, color: Colors.black)),
                      TextSpan(
                          text: '${calculateTargetDate().split(' ')[2]}',
                          style: const TextStyle(
                              fontSize: 24, color: Colors.teal)),
                      TextSpan(
                          text: '日 達成',
                          style: const TextStyle(
                              fontSize: 16, color: Colors.black)),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 220),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/approach-selection');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                minimumSize: const Size.fromHeight(
                  50,
                ), // 버튼 높이 설정
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    30.0,
                  ), // 버튼 모서리 둥글게
                ),
              ),
              child: const Text(
                '次へ',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String calculateTargetDate() {
    final now = DateTime.now();
    final targetDate = isRecommendedSelected
        ? DateTime(now.year, now.month + 1, now.day)
        : DateTime(now.year, now.month + 2, now.day);
    return '${targetDate.year} ${targetDate.month} ${targetDate.day}';
  }
}
