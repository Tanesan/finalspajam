import 'package:http/http.dart' as http; //httpリクエスト用
import 'dart:async'; //非同期処理用
import 'dart:convert'; //httpレスポンスをJSON形式に変換用
import 'package:finalspajam/models/FolloweeRequest.dart';
import 'package:finalspajam/models/FolloweeResponse.dart';
import 'package:finalspajam/data/followees.dart';

Future<FolloweeResponse> getFollowees(
    String accessToken, String secretAccessToken, String userId) async {
  //Future xxx async{} という記法
//  return FolloweeResponse.fromJson(followees);
  var url = "http://192.168.43.95:8080/follow_list";
//  var url = "https://jphacks-server-3gabclop4q-dt.a.run.app/follow_list";
  var request = FolloweeRequest(
      accessToken: accessToken,
      secretAccessToken: secretAccessToken,
      userId: userId);
  final response = await http.post(Uri.parse(url),
      body: json.encode(request.toJson()),
      headers: {"Content-Type": "application/json"});
  if (response.statusCode == 200) {
    return FolloweeResponse.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed');
  }
}
