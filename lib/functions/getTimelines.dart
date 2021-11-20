import 'package:http/http.dart' as http; //httpリクエスト用
import 'dart:async'; //非同期処理用
import 'dart:convert'; //httpレスポンスをJSON形式に変換用
import 'package:finalspajam/models/TimelineRequest.dart';
import 'package:finalspajam/models/TimelineResponse.dart';
//import 'package:finalspajam/data/timeline.dart';

Future<TimelineResponse> getTimelines(String id) async{ //Future xxx async{} という記法
//  return TimelineResponse.fromJson(timelineJson);

  var url = "https://jphacks-server-3gabclop4q-dt.a.run.app/timelines";
  var request = new TimelineRequest(id: id);
  final response = await http.post(Uri.parse(url),
      body: json.encode(request.toJson()),
      headers: {"Content-Type": "application/json"});
  if (response.statusCode == 200) {
    return TimelineResponse.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed');
  }
}
