import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';
import 'package:finalspajam/components/TimelineCard.dart';
import 'package:finalspajam/functions/getTimeline.dart';
import 'package:finalspajam/functions/startLearning.dart';
import 'package:finalspajam/models/TimelineResponse.dart';

class Timeline extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    const String name = "スパニャン_グリーン";

    return Scaffold(
        /*
        appBar: AppBar(
          title: Text("Timeline"),
        ),
       */
        body: Center(
            child: FutureBuilder(
                future: startLearning(),
                builder:
                    (BuildContext context, AsyncSnapshot<bool> existSnapshot) {
                  if (!existSnapshot.hasData) {
                    return CircularProgressIndicator();
                  }
                  if (!existSnapshot.data!) {
                    return Text("エラーが発生しました");
                  }
                  return StreamBuilder(
                      stream: IOWebSocketChannel.connect(
                              Uri.parse('ws://jphacks-server-3gabclop4q-dt.a.run.app/ws/notify'))
                          .stream,
                      builder:
                          (BuildContext context, AsyncSnapshot streamSnapshot) {
                        if (!streamSnapshot.hasData) {
                          return Text("データ解析中です。しばらくお待ちください。");
                        }
                        if (streamSnapshot.data! != "") {
                          print(streamSnapshot.data);
                          return FutureBuilder(
                              future: getTimeline(),
                              builder: (BuildContext context,
                                  AsyncSnapshot<TimelineResponse> snapshot) {
                                if (!snapshot.hasData) {
                                  return CircularProgressIndicator();
                                }
                                return SizedBox(
                                        width: .95 * width,
                                        child: Column(children: [
                                          SizedBox(height: .1 * height),
                                          SizedBox(
                                              height: .05 * height,
                                              child: Text("$nameさんのタイムライン",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold))),
                                          Expanded(
                                              child: ListView.builder(
                                                  itemCount: snapshot
                                                      .data!.timelines.length,
                                                  itemBuilder:
                                                      (BuildContext context,
                                                          int index) {
                                                    return TimelineCard(
                                                        timeline: snapshot.data!
                                                            .timelines[index]);
                                                  }))
                                        ]));
                              });
                        }
                        return Text("エラーが発生しました。");
                      });
                })));
  }
}
