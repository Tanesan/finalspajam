import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';
import 'package:finalspajam/components/Timelines.dart';
import 'package:finalspajam/functions/startLearning.dart';
import 'package:finalspajam/functions/isAnalysisFinished.dart';
import 'package:finalspajam/models/Argument.dart';

class Timeline extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Argument args =
        ModalRoute.of(context)!.settings.arguments as Argument;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

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
                          print(streamSnapshot.data);
                          return Timelines();
                        }
                        return Text("エラーが発生しました。");
                      });
                })));
  }
}
