import 'package:http/http.dart' as http; //httpリクエスト用
import 'dart:async'; //非同期処理用
import 'dart:convert'; //httpレスポンスをJSON形式に変換用
import 'package:finalspajam/models/NewsRequest.dart';
import 'package:finalspajam/models/NewsResponse.dart';
import 'package:finalspajam/data/news.dart';

Future<NewsResponse> getNews(String id) async {
  //Future xxx async{} という記法
//  return NewsResponse.fromJson(news);

  var url = "http://be78-180-39-77-67.ngrok.io/get_news";
  var request = new NewsRequest(id: id);
  final response = await http.post(Uri.parse(url),
      body: json.encode(request.toJson()),
      headers: {"Content-Type": "application/json"});
  if (response.statusCode == 200) {
    print("bef");
    print(response.body);
    print(json.decode(response.body));
    print("end");
    return NewsResponse.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed');
  }
}
