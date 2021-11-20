import 'package:http/http.dart' as http; //httpリクエスト用
import 'dart:async'; //非同期処理用
import 'dart:convert'; //httpレスポンスをJSON形式に変換用
import 'package:finalspajam/models/AdRequest.dart';
import 'package:finalspajam/models/AdResponse.dart';

Future<AdResponse> getAds(String id) async{ //Future xxx async{} という記法
  var url = "https://jphacks-server-3gabclop4q-dt.a.run.app/ads";
  var request = new AdRequest(id: id);
  final response = await http.post(Uri.parse(url),
      body: json.encode(request.toJson()),
      headers: {"Content-Type": "application/json"});
  if (response.statusCode == 200) {
    return AdResponse.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed');
  }
}
