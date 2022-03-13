import 'package:flutter/material.dart';
class TasksAction extends StatelessWidget {
  final Icon icon;
  final String title;
  final int currentTasks;
  final String taskPosition;
  final int completed;
  final Color color;

  const TasksAction(
      {Key? key,
        required this.icon,
        required this.title,
        required this.currentTasks,
        required this.taskPosition,
        required this.color,
        required this.completed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
                color: color, borderRadius: BorderRadius.circular(100)),
            child: icon,
          ),
          SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                title,
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800),
              ),
              Row(
                children: <Widget>[
                  Text(
                    '${currentTasks} tasks now .',
                    style: TextStyle(
                        color: Colors.black.withOpacity(.6),
                        fontWeight: FontWeight.w400,
                        fontSize: 20),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    '${completed} ${taskPosition}',
                    style: TextStyle(
                        color: Colors.black.withOpacity(.6),
                        fontWeight: FontWeight.w400,
                        fontSize: 20),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}