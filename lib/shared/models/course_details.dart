
class CourseDetails {
  final int id;
  final String title;
  final String description;
  final String price;
  final String instructor;
  final String durationByWeek;
  final String? image;
  final String enrollmentsCount;
  final String rate;
  final List<dynamic> reviews;

  CourseDetails({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.instructor,
    required this.durationByWeek,
    this.image,
    required this.enrollmentsCount,
    required this.rate,
    required this.reviews,
  });

  factory CourseDetails.fromJson(Map<String, dynamic> json) {
    return CourseDetails(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      price: json['price'],
      instructor: json['instructor'],
      durationByWeek: json['duration_by_weak'],
      image: json['image'],
      enrollmentsCount: json['enrollments_count'],
      rate: json['rate'],
      reviews: List<dynamic>.from(json['reviews']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'price': price,
      'instructor': instructor,
      'duration_by_weak': durationByWeek,
      'image': image,
      'enrollments_count': enrollmentsCount,
      'rate': rate,
      'reviews': reviews,
    };
  }
}
