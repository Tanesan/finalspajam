import 'package:finalspajam/models/NewsModel.dart';

class NewsResponse {
  final List<NewsModel> news;

  NewsResponse({required this.news});

  factory NewsResponse.fromJson(List<dynamic> json) {
    List<NewsModel> data =
        json.map((item) => NewsModel.fromJson(item)).toList();
    print(data);
    return NewsResponse(news: data);
  }
}
