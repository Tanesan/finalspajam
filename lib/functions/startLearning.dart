import 'package:http/http.dart' as http; //httpリクエスト用
import 'dart:async'; //非同期処理用
import 'dart:convert'; //httpレスポンスをJSON形式に変換用
import 'package:finalspajam/models/StartLearningRequest.dart';

Future<bool> startLearning() async{ //Future xxx async{} という記法
  var url = "https://jphacks-server-3gabclop4q-dt.a.run.app/target_user";
  var request = new StartLearningRequest(id: 1234);
  final response = await http.post(Uri.parse(url),
      body: json.encode(request.toJson()),
      headers: {"Content-Type": "application/json"});
  if (response.statusCode == 200) {
    return true;
  } else {
    return false;
  }
}
