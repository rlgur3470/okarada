class UserValue {
  String? sex;
  String? purpose;
  String? nickname;
  int? age;
  int? weight;
  String? userEmail;
  int? weightDiffrence;
  String? activityLevel;
  int? height;
  int? dailyKcal;

  UserValue({
    required this.sex,
    required this.purpose,
    required this.nickname,
    required this.age,
    required this.weight,
    required this.userEmail,
    required this.weightDiffrence,
    required this.activityLevel,
    required this.height,
    required this.dailyKcal,
  });

  UserValue copyWith({
    String? sex,
    String? purpose,
    String? nickname,
    int? age,
    int? weight,
    String? userEmail,
    int? weightDiffrence,
    String? activityLevel,
    int? height,
    int? dailyKcal,
  }) {
    return UserValue(
      sex: sex ?? this.sex,
      purpose: purpose ?? this.purpose,
      nickname: nickname ?? this.nickname,
      age: age ?? this.age,
      weight: weight ?? this.weight,
      height: height ?? this.height,
      userEmail: userEmail ?? this.userEmail,
      weightDiffrence: weightDiffrence ?? this.weightDiffrence,
      activityLevel: activityLevel ?? this.activityLevel,
      dailyKcal: dailyKcal ?? this.dailyKcal,
    );
  }
}
