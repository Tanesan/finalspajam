import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container(
      decoration: BoxDecoration(
          gradient: RadialGradient(
        radius: 2,
        colors: [
          Colors.white,
          Color(0xff7783FF),
          Color(0xffE5E5E5),
        ],
      )),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
              Text("誰のTLを表示しますか?",
                    style: Theme.of(context).textTheme.headline5),
            Padding(
              padding: EdgeInsets.only(left: 16, top: 32, right: 16),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(32.0),
                  ),
                  boxShadow: [
                    BoxShadow(
                      // color: Color(0xff8B98A4),
                      spreadRadius: 3,
                      color: Colors.black12,
                      blurRadius: 10,
                      offset: Offset(2, 2),
                    ),
                  ]),
                child: TextField(
                  enabled: true,
                  // 入力数
                  // maxLength: 10,
                  // maxLengthEnforced: false,
                  style: TextStyle(color: Color(0xff8B98A4), height: 1.4,fontSize: 18.0),
                  obscureText: false,
                  maxLines: 1,
                  decoration: new InputDecoration(
                    prefixIcon: Icon(Icons.search),
                        border: new OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(32.0),
                          ),
                          borderSide: BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                    // border: OutlineInputBorder(),
                    hintText: 'フォロー中のユーザーを検索',
                  ),
                  //パスワード
                  // onChanged: _handleText,
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
