class TimelineModel {
  final String goodedBy;
  final String iconUrl;
  final String senderName;
  final String senderId;
  final int datetime;
  final String message;
  final int numberOfGoods;

  TimelineModel({
    required this.goodedBy,
    required this.iconUrl,
    required this.senderName,
    required this.senderId,
    required this.datetime,
    required this.message,
    required this.numberOfGoods
  });

  factory TimelineModel.fromJson(Map<String, dynamic> json) {
    return TimelineModel(
        goodedBy: json['goodedBy'],
        iconUrl: json['iconUrl'],
        senderName: json['senderName'],
        senderId: json['senderId'],
        datetime: json['datetime'],
        message: json['message'],
        numberOfGoods: json['numberOfGoods']
    );
  }
}