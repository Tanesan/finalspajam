import 'package:http/http.dart' as http; //httpリクエスト用
import 'dart:async'; //非同期処理用
import 'dart:convert'; //httpレスポンスをJSON形式に変換用
import 'package:finalspajam/models/TimelineRequest.dart';
import 'package:finalspajam/models/TimelineResponse.dart';

Future<TimelineResponse> getTimeline() async{ //Future xxx async{} という記法
  return TimelineResponse(
      goodedBy: "スパニャン_グリーン",
      iconUrl: "https://www.nj.com/resizer/zovGSasCaR41h_yUGYHXbVTQW2A=/1280x0/smart/cloudfront-us-east-1.images.arcpublishing.com/advancelocal/SJGKVE5UNVESVCW7BBOHKQCZVE.jpg",
      senderName: "スパニャン_オレンジ",
      senderId: "@spanyan_orange",
      datetime: 1637413048426,
      message: "SPAJAM予選突破した！祝本戦出場！箱根だ〜\n温泉満喫して普通に寝落ちしそう。。。\n優勝できるように頑張るぞ〜",
      numberOfGoods: 9
  );

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
