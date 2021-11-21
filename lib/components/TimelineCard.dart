import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:finalspajam/models/TimelineModel.dart';
import 'package:finalspajam/functions/calculateElapsedTime.dart';

class TimelineCard extends StatelessWidget {
  final TimelineModel timeline;

  TimelineCard({required this.timeline});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    bool isDummyUsed = true;

    String elapsedTime = calculateElapsedTime(timeline.datetime);

    return Container(
        padding: EdgeInsets.symmetric(vertical: 5),
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
        child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(children: [
              Expanded(
                  flex: 1,
                  child: CircleAvatar(
                      backgroundImage: NetworkImage(timeline.iconUrl))),
              Expanded(
                  flex: 4,
                  child: Column(
//                                crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(Icons.favorite, color: Colors.grey),
                            //   Text(isDummyUsed ? "${timeline.goodedBy}がいいねしました" :
                            //       "${utf8.decode(timeline.goodedBy.runes.toList())}がいいねしました",
                            //       style: TextStyle(color: Colors.grey)),
                            // ]),
                        SizedBox(height: 10),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                  width: .35 * width,
                                  child: Text(
                                    isDummyUsed ? timeline.senderName :
                                      utf8.decode(
                                          timeline.senderName.runes.toList()),
                                      style: Theme.of(context).textTheme.subtitle2,
                                      overflow: TextOverflow.ellipsis)),
                              SizedBox(width: 5),
                              SizedBox(
                                  width: .2 * width,
                                  child: Text("@${timeline.senderId}",
                                      style: TextStyle(color: Colors.grey),
                                      overflow: TextOverflow.ellipsis)),
                              SizedBox(width: 5),
                              Text(
                                elapsedTime,
                                style: TextStyle(color: Colors.grey),
                              ),
                              SizedBox(width: 10)
                            ]),
                        SizedBox(height: 5),
                        Text(isDummyUsed ? timeline.message :utf8.decode(timeline.message.runes.toList())),
                        SizedBox(height: 10),
                        SizedBox(
                            width: .6 * width,
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(Icons.chat_bubble_outline),
                                  Icon(Icons.cached),
                                  Row(children: [
                                    Icon(Icons.favorite_border),
                                    Text("${timeline.numberOfGoods}")
                                  ]),
                                  Icon(Icons.share)
                                ])),
                        SizedBox(height: 20)
                      ])
            ]))])));
  }
}
