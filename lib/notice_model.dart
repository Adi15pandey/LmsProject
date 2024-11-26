class NoticeModel {
  final int? index;  // Changed to nullable (int?)
  final String noticeTypeName;
  final DateTime createdAt;
  final String filename;

  // Constructor
  NoticeModel({
    required this.index,
    required this.noticeTypeName,
    required this.createdAt,
    required this.filename,
  });

  // Factory method to create a NoticeModel from JSON
  factory NoticeModel.fromJson(Map<String, dynamic> json) {
    return NoticeModel(
      index: json['index'] != null ? json['index'] : null,
      noticeTypeName: json['notice']['notice']['noticeTypeName'] ?? '',
      createdAt: DateTime.parse(json['createdAt']),
      filename: json['filename'] ?? '',
    );
  }

  // Method to convert NoticeModel to JSON (for sending data to API)
  Map<String, dynamic> toJson() {
    return {
      'index': index,  // `index` can be null now
      'noticeTypeName': noticeTypeName,
      'createdAt': createdAt.toIso8601String(), // Convert DateTime to ISO 8601 format for API submission
      'filename': filename,
    };
  }
}
