import 'package:http/http.dart' as http; //httpリクエスト用
import 'dart:async'; //非同期処理用
import 'dart:convert'; //httpレスポンスをJSON形式に変換用
import 'package:finalspajam/models/TimelineRequest.dart';
import 'package:finalspajam/models/TimelineResponse.dart';
import 'package:finalspajam/data/timeline.dart';

Future<TimelineResponse> getTimeline() async{ //Future xxx async{} という記法
  return TimelineResponse.fromJson(timelineJson);

  /*
  var url = "http://172.16.0.223/creator/api/flutter_post_test";
  var request = new TimelineRequest(id: 1234, name: '大和賢一郎');
  final response = await http.post(Uri.parse(url),
      body: json.encode(request.toJson()),
      headers: {"Content-Type": "application/json"});
  if (response.statusCode == 200) {
    return TimelineResponse.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed');
  }
   */
}
