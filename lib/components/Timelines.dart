import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:finalspajam/components/TimelineCard.dart';
import 'package:finalspajam/functions/getTimelines.dart';
import 'package:finalspajam/models/Argument.dart';
import 'package:finalspajam/models/TimelineResponse.dart';

class Timelines extends StatefulWidget {
  const Timelines({Key? key}) : super(key: key);

  @override
  _TimelinesState createState() => _TimelinesState();
}

class _TimelinesState extends State<Timelines> {
  @override
  Widget build(BuildContext context) {
    final Argument args =
        ModalRoute.of(context)!.settings.arguments as Argument;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return FutureBuilder(
        future: getTimelines(args.targetUserId!),
        builder:
            (BuildContext context, AsyncSnapshot<TimelineResponse> snapshot) {
          if (!snapshot.hasData) {
            print("dummy");
            return CircularProgressIndicator();
          }
          return Padding(
            padding: EdgeInsets.only(right: 8, left: 8),
            child: Column(children: [
                  SizedBox(height: .05 * height),
                  SizedBox(
                      height: .05 * height,
                      child: Text(
                          "${utf8.decode(args.targetUserName!.runes.toList())}さんのタイムライン",
                          style: TextStyle(fontWeight: FontWeight.bold))),
                  Expanded(
                      child: RefreshIndicator(
                          onRefresh: () async {
                            setState(() {});
                          },
                          child: ListView.builder(
                              physics: AlwaysScrollableScrollPhysics(),
                              itemCount: snapshot.data!.timelines.length,
                              itemBuilder: (BuildContext context, int index) {
                                return TimelineCard(
                                    timeline: snapshot.data!.timelines[index]);
                              })))
                ]),
          );
        });
  }
}
