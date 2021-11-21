import 'package:finalspajam/models/NewsModel.dart';

class NewsResponse {
  final List<NewsModel> news;

  NewsResponse({required this.news});

  factory NewsResponse.fromJson(Map<String, dynamic> json) {
    print("hoge");
    print(json);
    List<NewsModel> data = [];
    for (int i = 0; i < 10; i++) {
      data.add(NewsModel.fromJson(json["${i.toString()}"]));
    }
    print(data);
    return NewsResponse(news: data);
  }
}
