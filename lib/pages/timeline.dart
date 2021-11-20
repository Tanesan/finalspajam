import 'package:flutter/material.dart';
import 'package:finalspajam/components/TimelineCard.dart';
import 'package:finalspajam/functions/getTimeline.dart';
import 'package:finalspajam/models/TimelineResponse.dart';

class Timeline extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
        /*
        appBar: AppBar(
          title: Text("Timeline"),
        ),
       */
        body: FutureBuilder(
            future: getTimeline(),
            builder: (BuildContext context,
                AsyncSnapshot<TimelineResponse> snapshot) {
              if (!snapshot.hasData) {
                return CircularProgressIndicator();
              }
              return Center(
                  child: SizedBox(
                      width: .95 * width,
                      child: Column(children: [
                        SizedBox(height: .1*height),
                        SizedBox(height: .05*height,
                            child: Text("${snapshot.data!.senderName}さんの投稿",
                            style: TextStyle(fontWeight: FontWeight.bold))),
                        Expanded(
                            child: ListView.builder(
                                itemCount: 10,
                                itemBuilder: (BuildContext context, int index) {
                                  return TimelineCard(response: snapshot.data!);
                                }))
                      ])));
            }));
  }
}
