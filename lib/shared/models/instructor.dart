
class Instructor {
  final int id;
  final String fullName;
  final String specialty;
  final String description;
  final String experience;
  final List<String> images;
  final Contacts contacts;
  final String studentsCount;

  Instructor({
    required this.id,
    required this.fullName,
    required this.specialty,
    required this.description,
    required this.experience,
    required this.images,
    required this.contacts,
    required this.studentsCount,
  });

  factory Instructor.fromJson(Map<String, dynamic> json) {
    return Instructor(
      id: json['id'] as int,
      fullName: json['full_name'] as String,
      specialty: json['specialty'] as String,
      description: json['description'] as String,
      experience: json['experience'] as String,
      images: List<String>.from(json['images']),
      contacts: Contacts.fromJson(json['contacts']),
      studentsCount: json['students_count'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'full_name': fullName,
      'specialty': specialty,
      'description': description,
      'experience': experience,
      'images': images,
      'contacts': contacts.toJson(),
      'students_count': studentsCount,
    };
  }
}

class Contacts {
  final String facebook;
  final String instagram;
  final String twitter;
  final String linkedin;
  final String youtube;
  final String whatsapp;

  Contacts({required this.facebook,required this.instagram,required this.twitter,required this.linkedin,required this.youtube,required this.whatsapp});

  factory Contacts.fromJson(Map<String, dynamic> json) {
    return Contacts(
      facebook: json['Facebook'] ?? '',
      instagram: json['Instagram'] ?? '',
      twitter: json['Twitter'] ?? '',
      linkedin: json['LinkedIn'] ?? '',
      youtube: json['Youtube'] ?? '',
      whatsapp: json['Whatsapp'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Facebook': facebook,
      'Instagram': instagram,
      'Twitter': twitter,
      'LinkedIn': linkedin,
      'Youtube': youtube,
      'Whatsapp': whatsapp,
    };
  }
}
