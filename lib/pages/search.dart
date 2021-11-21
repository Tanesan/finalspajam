import 'dart:convert';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:finalspajam/functions/getFollowees.dart';
import 'package:finalspajam/models/Argument.dart';
import 'package:finalspajam/models/FolloweeResponse.dart';
import 'package:finalspajam/models/SearchModel.dart';

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    final Argument args =
        ModalRoute.of(context)!.settings.arguments as Argument;

    return Scaffold(
        appBar: AppBar(
            title: Text("誰のTLを表示しますか？"),
        ),
        body: Container(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: FutureBuilder(
                    future: getFollowees(args.accessToken!,
                        args.secretAccessToken!, args.userId!),
                    builder: (BuildContext context,
                        AsyncSnapshot<FolloweeResponse> snapshot) {
                      if (!snapshot.hasData) {
                        return CircularProgressIndicator();
                      }
                      return ChangeNotifierProvider<SearchModel>(
                          create: (_) =>
                              SearchModel(searchList: snapshot.data!.followees),
                          child: Consumer<SearchModel>(
                            builder: (context, model, child) {
                              model.search();
                              return Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: 16,
                                          top: 32,
                                          right: 16,
                                          bottom: 32),
                                      child: Container(
                                        height: 50,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                const BorderRadius.all(
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
                                                color: Color(0xff8B98A4),
                                                height: 1.4,
                                                fontSize: 18.0),
                                            obscureText: false,
                                            maxLines: 1,
                                            decoration: new InputDecoration(
                                              prefixIcon: Icon(Icons.search),
                                              border: new OutlineInputBorder(
                                                borderRadius:
                                                    const BorderRadius.all(
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
                                            onChanged: (text) {
                                              // onChangedは入力されている文字が変更するたびに呼ばれます
                                              model.text = text;
                                              model.search();
                                            }),
                                      ),
                                    ),
                                    Expanded(
                                        child: SizedBox(
                                            height: 200.toDouble() *
                                                model.searchResultList.length,
                                            child: ListView.builder(
                                                itemCount: model.searchResultList.length,
                                                shrinkWrap: true,
                                                itemBuilder:
                                                    (BuildContext context,
                                                        int index) {
                                                  return GestureDetector(
                                                      onTap: () {
                                                        args.targetUserId =
                                                            model.searchResultList[index]
                                                                .id;
                                                        args.targetUserName =
                                                            model.searchResultList[index]
                                                                .name;
                                                        Navigator.of(context)
                                                            .pushNamed(
                                                                '/timeline',
                                                                arguments:
                                                                    args);
                                                      },
                                                      child: Card(
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      24.0),
                                                        ),
                                                        elevation: 1.0,
                                                        margin: EdgeInsets
                                                            .symmetric(
                                                                horizontal:
                                                                    10.0,
                                                                vertical: 6.0),
                                                        child: Container(
                                                          child: ListTile(
                                                            contentPadding:
                                                                EdgeInsets.symmetric(
                                                                    horizontal:
                                                                        20.0,
                                                                    vertical:
                                                                        10.0),
                                                            leading: CircleAvatar(
                                                                backgroundImage:
                                                                    NetworkImage(model
                                                                        .searchResultList[
                                                                            index]
                                                                        .iconUrl)),
                                                            title: Text(utf8
                                                                .decode(model
                                                                    .searchResultList[
                                                                        index]
                                                                    .name
                                                                    .runes
                                                                    .toList())),
                                                            subtitle: Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                    "@" +
                                                                        utf8.decode(model
                                                                            .searchResultList[
                                                                                index]
                                                                            .screenName
                                                                            .runes
                                                                            .toList()),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .left),
                                                                Text(
                                                                    utf8.decode(model
                                                                        .searchResultList[
                                                                            index]
                                                                        .description
                                                                        .runes
                                                                        .toList()),
                                                                    style: Theme.of(
                                                                            context)
                                                                        .textTheme
                                                                        .caption),
                                                              ],
                                                            ),
                                                            trailing: Icon(Icons
                                                                .arrow_forward),
                                                          ),
                                                        ),
                                                      ));
                                                })))
                                  ]);
                            },
                          ));
                    }),
              ),
            )));
  }
}
