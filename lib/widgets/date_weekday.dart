import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class DateWeekDay extends StatelessWidget {
  int day;
  Color color;
  int weekDay;
  DateWeekDay({Key? key,required this.day,required this.weekDay,required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(DateFormat('EEE').format(DateTime.now().add(Duration(days: day))),style: TextStyle(color: color,fontSize: 16,),),
          SizedBox(height: 3,),
          Text(DateFormat('d').format(DateTime.now().add(Duration(days: weekDay))),style: TextStyle(color: color,fontSize: 16,),),


        ],
      ),
    );
  }
}
