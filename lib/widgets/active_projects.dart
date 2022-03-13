import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';


class ActiveProjects extends StatelessWidget {
  final Color color;
  final String projectTitle;
  final int progress;
  final double percentage;

  const ActiveProjects(
      {Key? key,
        required this.color,
        required this.projectTitle,
        required this.progress,
        required this.percentage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Container(
      width: width * .45,
      height: width * .62,
      decoration:
      BoxDecoration(color: color, borderRadius: BorderRadius.circular(40)),
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Align(
            child: CircularPercentIndicator(
              radius: width * .15,
              lineWidth: 8.0,
              animation: true,
              percent: percentage,
              center: new Text(
                "${(100 * percentage).toInt()}%",
                style:
                new TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
              ),
              circularStrokeCap: CircularStrokeCap.round,
              progressColor: Colors.white,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                projectTitle,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
              Text(
                '${progress} hours progress',
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.black.withOpacity(.5),
                    fontWeight: FontWeight.w300),
              )
            ],
          )
        ],
      ),
    );
  }
}