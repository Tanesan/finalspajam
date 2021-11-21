import 'dart:convert';

class NewsModel {
  final String name;
  final String url;
  final String urlToImage;

  NewsModel({required this.name, required this.url, required this.urlToImage});

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    print(json['title']);
    print(utf8.decode(json['title'].runes.toList()));
    return NewsModel(
        name: json['title'], url: json['url'], urlToImage: json['urlToImage']);
  }
}
