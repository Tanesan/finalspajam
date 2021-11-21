import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:finalspajam/models/TimelineModel.dart';
import 'package:finalspajam/functions/calculateElapsedTime.dart';

WebViewController? _controller; // WebVewコントローラー

class News extends StatelessWidget {
  const News({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: GridView.count(
            crossAxisCount: 2,
            children: List.generate(10, (index) {
              return Center(
                  child: Card(
                child: InkWell(
                  splashColor: Colors.blue.withAlpha(30),
                  onTap: () {
                    print('Card tapped.');
                  },
                  child: Container(
                    width: 300,
                    height: 300,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                        Container(
                        width: 300,
                        height: 100,
                        child:
                        Image.network('https://connpass-tokyo.s3.amazonaws.com/thumbs/31/de/31de927efc4c9f7b11c5baa193490ad9.png',
                        )),
                          Text('明日の天気、西日本は荒天の週明け', style: Theme.of(context).textTheme.subtitle2),
                    ]),
                  ),
                ),
              ));
            })));
  }
}
