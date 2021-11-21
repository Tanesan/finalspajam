import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';
import 'package:finalspajam/components/Timelines.dart';
import 'package:finalspajam/components/News.dart';
import 'package:finalspajam/functions/startLearning.dart';
import 'package:finalspajam/functions/isAnalysisFinished.dart';
import 'package:finalspajam/models/Argument.dart';

class Timeline extends StatefulWidget {
  const Timeline({Key? key}) : super(key: key);

  @override
  _TimelineState createState() => _TimelineState();
}

class _TimelineState extends State<Timeline> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Argument args =
        ModalRoute.of(context)!.settings.arguments as Argument;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
        appBar: AppBar(
          title: Text(_selectedIndex == 0 ?
          "${utf8.decode(args.targetUserName!.runes.toList())}さんの投稿" :
          "${utf8.decode(args.targetUserName!.runes.toList())}さんが読んでそうなニュース"),
        ),
        body: Center(
            child: FutureBuilder(
                future: startLearning(args.targetUserId!),
                builder:
                    (BuildContext context, AsyncSnapshot<bool> existSnapshot) {
                  if (!existSnapshot.hasData) {
                    return CircularProgressIndicator();
                  }
                  if (!existSnapshot.data!) {
                    print(existSnapshot.data);
                    return Text("エラーが発生しました");
                  }
                  return StreamBuilder(
                      stream: IOWebSocketChannel.connect(Uri.parse(
                              'ws://jphacks-server-3gabclop4q-dt.a.run.app/ws/notify'))
                          .stream,
                      builder:
                          (BuildContext context, AsyncSnapshot streamSnapshot) {
                        if (!streamSnapshot.hasData) {
                          return Text("データ解析中です。しばらくお待ちください。");
                        }
                        if (isAnalysisFinished(
                            args.targetUserId!, streamSnapshot.data!)) {
                          return (_selectedIndex == 0 ? Timelines() : News());
//                          return TiemlinesAndAds();
                        } else {
                          print("target: ${args.targetUserId}");
                          print("finished: ${streamSnapshot.data}");
                          return _selectedIndex == 0 ? Timelines() : News();
//                          return Text("データ解析中です。しばらくお待ちください。");
                        }
                      });
                })),
        bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.blue,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
                backgroundColor: Colors.red,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.business),
                label: 'Business',
                backgroundColor: Colors.green,
              )
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.amber[800],
            onTap: _onItemTapped));
  }
}
