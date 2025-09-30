class AppSetting {
  final String color;

  AppSetting({required this.color});

  factory AppSetting.fromJson(Map<String, dynamic> json) {
    return AppSetting(
      color: json['color'] as String,
    );
  }
}
