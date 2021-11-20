import 'package:flutter/material.dart';
import 'package:finalspajam/models/TimelineResponse.dart';
import 'package:finalspajam/functions/calculateElapsedTime.dart';

class TimelineCard extends StatelessWidget {
  final TimelineResponse response;

  TimelineCard({required this.response});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    String elapsedTime = calculateElapsedTime(response.datetime);

    return Container(
        padding: EdgeInsets.symmetric(vertical: 5),
        child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(children: [
              Expanded(
                  flex: 1,
                  child: CircleAvatar(
                      backgroundImage: NetworkImage(response.iconUrl))),
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
                              Text("${response.goodedBy}がいいねしました",
                                  style: TextStyle(color: Colors.grey)),
                            ]),
                        SizedBox(height: 10),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                  width: .35 * width,
                                  child: Text(response.senderName,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                      overflow: TextOverflow.ellipsis)),
                              SizedBox(width: 5),
                              SizedBox(
                                  width: .2 * width,
                                  child: Text(response.senderId,
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
                        Text(response.message),
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
                                    Text("${response.numberOfGoods}")
                                  ]),
                                  Icon(Icons.share)
                                ])),
                        SizedBox(height: 20)
                      ]))
            ])));
  }
}
