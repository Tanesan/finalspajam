import 'package:flutter/material.dart';
import 'package:finalspajam/components/TimelineCard.dart';
import 'package:finalspajam/functions/getTimelinesAndAds.dart';
import 'package:finalspajam/models/Argument.dart';
import 'package:finalspajam/models/TimelineAndAd.dart';

class TimelinesAndAds extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Argument args =
    ModalRoute.of(context)!.settings.arguments as Argument;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return FutureBuilder(
        future: getTimelinesAndAds(args.targetUserId!),
        builder: (BuildContext context,
            AsyncSnapshot<List<TimelineAndAd>> snapshot) {
          if (!snapshot.hasData) {
            return CircularProgressIndicator();
          }
          return SizedBox(
              width: .95 * width,
              child: Column(children: [
                SizedBox(height: .1 * height),
                SizedBox(
                    height: .05 * height,
                    child: Text("${args.targetUserName}さんのタイムライン",
                        style: TextStyle(
                            fontWeight:
                            FontWeight.bold))),
                Expanded(
                    child: ListView.builder(
                        itemCount: snapshot
                            .data!.length,
                        itemBuilder:
                            (BuildContext context,
                            int index) {
                          return TimelineCard(
                              timeline: snapshot.data!
                                  [index].timeline);
                        }))
              ]));
        });
  }
}
