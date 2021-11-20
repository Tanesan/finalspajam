import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:finalspajam/models/Argument.dart';

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Argument args =
        ModalRoute.of(context)!.settings.arguments as Argument;

    return Scaffold(
        body: Container(
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
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 64.0),
                child: Text("誰のTLを表示しますか?",
                    style: Theme.of(context).textTheme.headline5),
              ),
              Padding(
                padding:
                    EdgeInsets.only(left: 16, top: 32, right: 16, bottom: 32),
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
                    style: TextStyle(
                        color: Color(0xff8B98A4), height: 1.4, fontSize: 18.0),
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
              Expanded(
                  child: SingleChildScrollView(
                      child: GestureDetector(
                          onTap: () => print("As"),
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24.0),
                            ),
                            elevation: 8.0,
                            margin: EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 6.0),
                            child: Container(
                              child: ListTile(
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 20.0, vertical: 10.0),
                                leading: CircleAvatar(
                                    backgroundImage: NetworkImage(
                                        "https://tanemura.dev/img/icons.png")),
                                title: Text("Keito Tanemura"),
                                subtitle: Text("twitter discription"),
                                trailing: Icon(Icons.arrow_forward),
                              ),
                            ),
                          )))),
            ],
          ),
        ),
      ),
    ));
  }
}
