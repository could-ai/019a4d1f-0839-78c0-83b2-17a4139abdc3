class JobApplication {
  final String id;
  final String companyName;
  final String position;
  final String applicantName;
  final String email;
  final String phone;
  final DateTime applicationDate;
  final List<String> uploadedDocuments; // List of document file paths
  final String status; // 'pending', 'reviewed', 'accepted', 'rejected'

  JobApplication({
    required this.id,
    required this.companyName,
    required this.position,
    required this.applicantName,
    required this.email,
    required this.phone,
    required this.applicationDate,
    required this.uploadedDocuments,
    this.status = 'pending',
  });

  // Create a copy with updated fields
  JobApplication copyWith({
    String? id,
    String? companyName,
    String? position,
    String? applicantName,
    String? email,
    String? phone,
    DateTime? applicationDate,
    List<String>? uploadedDocuments,
    String? status,
  }) {
    return JobApplication(
      id: id ?? this.id,
      companyName: companyName ?? this.companyName,
      position: position ?? this.position,
      applicantName: applicantName ?? this.applicantName,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      applicationDate: applicationDate ?? this.applicationDate,
      uploadedDocuments: uploadedDocuments ?? this.uploadedDocuments,
      status: status ?? this.status,
    );
  }

  // Convert to JSON for storage (future Supabase integration)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'companyName': companyName,
      'position': position,
      'applicantName': applicantName,
      'email': email,
      'phone': phone,
      'applicationDate': applicationDate.toIso8601String(),
      'uploadedDocuments': uploadedDocuments,
      'status': status,
    };
  }

  // Create from JSON
  factory JobApplication.fromJson(Map<String, dynamic> json) {
    return JobApplication(
      id: json['id'],
      companyName: json['companyName'],
      position: json['position'],
      applicantName: json['applicantName'],
      email: json['email'],
      phone: json['phone'],
      applicationDate: DateTime.parse(json['applicationDate']),
      uploadedDocuments: List<String>.from(json['uploadedDocuments']),
      status: json['status'],
    );
  }
}