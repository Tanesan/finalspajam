import 'dart:convert';

import 'package:finalspajam/models/FolloweeModel.dart';
import 'package:flutter/cupertino.dart';

class SearchModel extends ChangeNotifier {
  final List<FolloweeModel> searchList;
  SearchModel({required this.searchList});
  String text = ''; // TextFieldの値を受け取ります

  List<FolloweeModel> searchResultList = []; // 検索結果が渡されます

  // 検索の中身
  search() {
    if (this.text.isNotEmpty) {
      // 何か文字が入力された実行する
      searchResultList.clear(); // .add で増やしているので毎回clearしている
      // ここから検索処理
      this.searchList.forEach(
            (element) {
              // print(element.name);
              // print(this.text);
          if (element.name.toLowerCase().contains(this.text.toLowerCase())) {
            // .contains で文字列の部分一致を判定できる
            searchResultList.add(element); // 一致している要素があれば追加する
          }else if(utf8.decode(element.name.runes.toList()).contains(this.text.toLowerCase())){
            searchResultList.add(element);
          }
        },
      );
      notifyListeners(); // これを実行すると再描画される
    } else {
      searchResultList = [...searchList];
      notifyListeners(); // これを実行すると再描画される
    }
  }
}