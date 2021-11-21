class TimelineModel {
  final String iconUrl;
  final String senderName;
  final String senderId;
  final DateTime datetime;
  final String message;
  final int numberOfGoods;

  TimelineModel({
    required this.iconUrl,
    required this.senderName,
    required this.senderId,
    required this.datetime,
    required this.message,
    required this.numberOfGoods
  });

  factory TimelineModel.fromJson(Map<String, dynamic> json) {
    return TimelineModel(
        iconUrl: json['profile_image_url'],
        senderName: json['name'],
        senderId: json['screen_name'],
        datetime: DateTime.parse(json['created_at']),
        message: json['message'],
        numberOfGoods: int.parse(json['favourite_count'])
    );
  }
}