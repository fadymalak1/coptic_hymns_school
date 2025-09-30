

class Information {
  final String logo;
  final String title;
  final String subTitle;
  final List<String> images;

  Information({
    required this.logo,
    required this.title,
    required this.subTitle,
    required this.images,
  });

  factory Information.fromJson(Map<String, dynamic> json) {
    final imagesJson = json['images'] as List<dynamic>? ?? [];
    return Information(
      logo: json['logo'] as String? ?? '',
      title: json['title'] as String? ?? '',
      subTitle: json['sub_title'] as String? ?? '',
      images: imagesJson.map((e) => e.toString()).toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'logo': logo,
    'title': title,
    'sub_title': subTitle,
    'images': images,
  };
}
