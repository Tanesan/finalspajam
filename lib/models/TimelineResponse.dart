class TimelineResponse {
  final String goodedBy;
  final String iconUrl;
  final String senderName;
  final String senderId;
  final int datetime;
  final String message;
  final int numberOfGoods;

  TimelineResponse({
    required this.goodedBy,
    required this.iconUrl,
    required this.senderName,
    required this.senderId,
    required this.datetime,
    required this.message,
    required this.numberOfGoods
  });

  factory TimelineResponse.fromJson(Map<String, dynamic> json) {
    return TimelineResponse(
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