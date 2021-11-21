import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:finalspajam/models/TimelineModel.dart';
import 'package:finalspajam/models/NewsResponse.dart';
import 'package:finalspajam/functions/calculateElapsedTime.dart';
import 'package:finalspajam/functions/getNews.dart';

class News extends StatefulWidget {
  final String id;
  const News({Key? key, required this.id}) : super(key: key);

  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<News> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return FutureBuilder(
        future: getNews(widget.id),
        builder: (BuildContext context, AsyncSnapshot<NewsResponse> snapshot) {
          if (!snapshot.hasData) {
            return CircularProgressIndicator();
          }
          return RefreshIndicator(
              onRefresh: () async {
                setState(() {});
              },
              child: ListView.builder(
                  physics: AlwaysScrollableScrollPhysics(),
                  itemCount: snapshot.data!.news.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Center(
                        child: Card(
                      child: InkWell(
                        splashColor: Colors.blue.withAlpha(30),
                        onTap: () {
                          print('Card tapped.');
                        },
                        child: Container(
                          width: 0.9 * width,
                          height: 200,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                    flex: 1,
                                    child: Image.network(
                                      snapshot.data!.news[index].urlToImage
                                    )),
                                SizedBox(width: 10),
                                Expanded(
                                    flex: 1,
                                    child: Text(snapshot.data!.news[index].name,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 6,
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle2)),
                              ]),
                        ),
                      ),
                    ));
                  }));
        });
  }
}
