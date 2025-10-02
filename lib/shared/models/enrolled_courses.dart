class EnrolledCourse {
  final int id;
  final String title;
  final String description;
  final String? imageUrl;
  final String instructor;
  final String durationByWeek;
  final String enrollmentsCount;
  final List<dynamic> videos;

  EnrolledCourse({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.instructor,
    required this.durationByWeek,
    required this.enrollmentsCount,
    required this.videos,
  });

  factory EnrolledCourse.fromJson(Map<String, dynamic> json) {
    return EnrolledCourse(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      imageUrl: json['image_url'],
      instructor: json['instructor'],
      durationByWeek: json['duration_by_week'],
      enrollmentsCount: json['enrollments_count'],
      videos: json['videos'] ?? [],
    );
  }
}

class Enrollment {
  final int enrollmentId;
  final String enrolledAt;
  final EnrolledCourse course;

  Enrollment({
    required this.enrollmentId,
    required this.enrolledAt,
    required this.course,
  });

  factory Enrollment.fromJson(Map<String, dynamic> json) {
    return Enrollment(
      enrollmentId: json['enrollment_id'],
      enrolledAt: json['enrolled_at'],
      course: EnrolledCourse.fromJson(json['course']),
    );
  }
}
