class Notice {
  final String id;
  final NoticeID noticeID;
  final Data data;

  Notice({
    required this.id,
    required this.noticeID,
    required this.data,
  });

  factory Notice.fromJson(Map<String, dynamic> json) {
    return Notice(
      id: json['_id'],
      noticeID: NoticeID.fromJson(json['NoticeID']),
      data: Data.fromJson(json['data']),
    );
  }
}

class NoticeID {
  final String filename;
  final String user;

  NoticeID({
    required this.filename,
    required this.user,
  });

  factory NoticeID.fromJson(Map<String, dynamic> json) {
    return NoticeID(
      filename: json['filename'],
      user: json['user'],
    );
  }
}

class Data {
  final int account;
  final String date;
  final String email;
  final int mobileNumber;
  final String name;

  Data({
    required this.account,
    required this.date,
    required this.email,
    required this.mobileNumber,
    required this.name,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      account: json['account'],
      date: json['date'],
      email: json['email'],
      mobileNumber: json['mobilenumber'],
      name: json['name'],
    );
  }
}
