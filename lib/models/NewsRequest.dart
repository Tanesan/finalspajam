class NewsRequest {
  final String id;
  NewsRequest({
    required this.id,
  });
  Map<String, dynamic> toJson() => {
    'id': id,
  };
}