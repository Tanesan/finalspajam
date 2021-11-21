class NewsModel {
  final String name;
  final String url;
  final String urlToImage;

  NewsModel({required this.name, required this.url, required this.urlToImage});

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
        name: json['title'], url: json['url'], urlToImage: json['urlToImage']);
  }
}
