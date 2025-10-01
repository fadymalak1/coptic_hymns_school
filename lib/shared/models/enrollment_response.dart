class EnrolmentResponse {
  final String status;
  final int enrollmentId;
  final String courseName;
  final String price;
  final String paymentMethod;
  final String? accountName;
  final String? iban;
  final String? swift;
  final String? accountNumber;
  final String? bankName;
  final String? bankAddress;

  EnrolmentResponse({
    required this.status,
    required this.enrollmentId,
    required this.courseName,
    required this.price,
    required this.paymentMethod,
    this.accountName,
    this.iban,
    this.swift,
    this.accountNumber,
    this.bankName,
    this.bankAddress,
  });

  factory EnrolmentResponse.fromJson(Map<String, dynamic> json) {
    return EnrolmentResponse(
      status: json['status'],
      enrollmentId: json['enrollment_id'],
      courseName: json['course_name'],
      price: json['price'],
      paymentMethod: json['payment_method'],
      accountName: json['account_name'],
      iban: json['iban'],
      swift: json['swift'],
      accountNumber: json['account_number'],
      bankName: json['bank_name'],
      bankAddress: json['bank_address'],
    );
  }
}
