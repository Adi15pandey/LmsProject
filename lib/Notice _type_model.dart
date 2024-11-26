class NoticeType {
  final String noticeTypeId;
  final String noticeTypeName;
  final bool status;

  NoticeType({
    required this.noticeTypeId,
    required this.noticeTypeName,
    required this.status,
  });

  factory NoticeType.fromJson(Map<String, dynamic> json) {
    return NoticeType(
      noticeTypeId: json['noticeTypeId'],
      noticeTypeName: json['noticeTypeName'],
      status: json['status'],
    );
  }
}
