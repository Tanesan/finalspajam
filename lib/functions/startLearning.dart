import 'package:http/http.dart' as http; //httpリクエスト用
import 'dart:async'; //非同期処理用

Future<bool> startLearning(String id) async{ //Future xxx async{} という記法
  var url = "https://jphacks-server-3gabclop4q-dt.a.run.app/target_user?target_user_id=$id";
  final response = await http.post(Uri.parse(url),
      headers: {"Content-Type": "application/json"});
  if (response.statusCode == 200) {
    return true;
  } else {
    return false;
  }
}
