import 'package:flutter/material.dart';
import 'package:weight_control/user_data_creator/User_Data_Creator.dart';

class MealScreen extends StatelessWidget {
  final String cuisine;
  final String mealTime;
  final String imagePath;
  final Map<String, List<Map<String, dynamic>>> mealData;
  final Widget nextMealScreen;
  final UserValue userValue;

  const MealScreen({
    required this.cuisine,
    required this.mealTime,
    required this.imagePath,
    required this.mealData,
    required this.nextMealScreen,
    required this.userValue,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Color userGenderColor = userValue.userGenderColor!;
    final List<Map<String, dynamic>> meals = mealData[mealTime] ?? [];

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            imagePath,
            fit: BoxFit.fill,

          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SafeArea(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: (){
                        Navigator.of(context).pop();
                      },
                      icon: Icon(Icons.arrow_back)
                    ),
                    Text(
                      _getMealTitle(mealTime),
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w600),
                    ),
                    Image.asset(
                      'asset/okarada_logo_image/okarada_logo.png',
                      scale: 15,
                    )
                  ],
                ),
              ),
              SizedBox(height: 80),
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  itemCount: meals.length,
                  itemBuilder: (context, index) {
                    return Card(
                      margin: EdgeInsets.symmetric(vertical: 10.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: ListTile(
                        leading: Icon(Icons.food_bank,
                            size: 40, color: userGenderColor),
                        title: Text(
                          meals[index]['food_name'],
                          style: TextStyle(color: userGenderColor),
                        ),
                        subtitle: Text(
                          '${meals[index]['calories']} kcal',
                          style: TextStyle(color: userGenderColor),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 16, right: 16),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => nextMealScreen),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: userGenderColor,
                  ),
                  child: Text(
                    mealTime == '朝ご飯'
                        ? '昼ご飯へ'
                        : mealTime == '昼ご飯'
                            ? '夜ご飯へ'
                            : '次へ',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 50),
            ],
          ),
        ],
      ),
    );
  }

  String _getMealTitle(String mealTime) {
    switch (mealTime) {
      case '朝ご飯':
        return '朝ご飯';
      case '昼ご飯':
        return '昼ご飯';
      case '夜ご飯':
        return '夜ご飯';
      default:
        return '';
    }
  }
}
