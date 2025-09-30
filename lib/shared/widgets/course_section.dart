//
// import 'package:coptic_hymns_school/shared/models/course.dart';
// import 'package:flutter/material.dart';
//
// class CoursesSection extends StatelessWidget {
//   final String userCountry;
//
//   CoursesSection({super.key, required this.userCountry});
//
//   final List<Course> courses = [
//     Course(
//       title: "Foundation of Coptic Hymns",
//       description: "Learn the fundamental melodies of Coptic hymns.",
//       image: "https://images.unsplash.com/photo-1711351006804-4b97e8f92461",
//       priceEgypt: 800,
//       priceInternational: 35,
//       duration: "8 weeks",
//       students: 245,
//       rating: 4.9,
//     ),
//     Course(
//       title: "Advanced Liturgical Melodies",
//       description: "Master the complex melodies of the Divine Liturgy.",
//       image: "https://images.unsplash.com/photo-1718123801538-bb4f0c356847",
//       priceEgypt: 1200,
//       priceInternational: 55,
//       duration: "12 weeks",
//       students: 178,
//       rating: 4.8,
//     ),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     final isEgypt = userCountry == "Egypt";
//
//     return Container(
//       color: Colors.white,
//       padding: const EdgeInsets.all(24),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Text(
//             "Master Sacred Melodies",
//             style: TextStyle(
//               fontSize: 28,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           const SizedBox(height: 16),
//           Column(
//             children: courses.map((course) {
//               return Card(
//                 margin: const EdgeInsets.symmetric(vertical: 12),
//                 elevation: 4,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 child: Column(
//                   children: [
//                     Image.network(course.image, fit: BoxFit.cover),
//                     Padding(
//                       padding: const EdgeInsets.all(16),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(course.title,
//                               style: const TextStyle(
//                                   fontSize: 20, fontWeight: FontWeight.bold)),
//                           const SizedBox(height: 8),
//                           Text(course.description),
//                           const SizedBox(height: 12),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text(
//                                 isEgypt
//                                     ? "${course.priceEgypt} EGP"
//                                     : "\$${course.priceInternational}",
//                                 style: const TextStyle(
//                                   fontSize: 18,
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.orange,
//                                 ),
//                               ),
//                               ElevatedButton(
//                                 onPressed: () {
//                                   // Navigate to Register
//                                 },
//                                 style: ElevatedButton.styleFrom(
//                                   backgroundColor: Colors.orange,
//                                   foregroundColor: Colors.white,
//                                 ),
//                                 child: const Text("Register Now"),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               );
//             }).toList(),
//           )
//         ],
//       ),
//     );
//   }
// }
