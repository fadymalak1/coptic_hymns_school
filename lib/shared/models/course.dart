
class Course {
  final int id;
  final String title;
  final String description;
  final String price;
  final String instructor;
  final String? image;
  final String enrollmentsCount;
  final String rate;

  Course({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.instructor,
    this.image,
    required this.enrollmentsCount,
    required this.rate,
  });

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      price: json['price'] ?? '0.00',
      instructor: json['instructor'] ?? '',
      image: json['image'],
      enrollmentsCount: json['enrollments_count'] ?? '0',
      rate: json['rate'] ?? '0.00',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'price': price,
      'instructor': instructor,
      'image': image,
      'enrollments_count': enrollmentsCount,
      'rate': rate,
    };
  }
}