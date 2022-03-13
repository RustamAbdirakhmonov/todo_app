import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/screens/add_task_screen.dart';

import '../widgets/date_weekday.dart';

class DailyPlanScreen extends StatefulWidget {
  const DailyPlanScreen({Key? key}) : super(key: key);
  static const routeArgs = '/daily';

  @override
  State<DailyPlanScreen> createState() => _DailyPlanScreenState();
}

class _DailyPlanScreenState extends State<DailyPlanScreen> {
  Color color1=Colors.black;
  Color color2=Colors.black;
  Color color3=Colors.black;
  Color color4=Colors.black;
  Color color5=Colors.black;
  Color color6=Colors.black;
  Color color7=Colors.black;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var defaultPadding = 15;

    return Scaffold(
      backgroundColor: Colors.pink.shade50,
      body: Container(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(top: 30, bottom: 30),
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(Icons.navigate_before,
                    size: 30, color: Colors.black.withOpacity(.7)),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Text(
                      'Today',
                      style: TextStyle(
                        fontSize: 45,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      'Productive day, Philip',
                      style: TextStyle(
                          fontSize: 20, color: Colors.black.withOpacity(.4)),
                    )
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(AddTaskScreen.routeArgs);
                  },
                  child: const Text(
                    'Add task',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w700),
                  ),
                  style: ButtonStyle(
                     padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 15,horizontal: 30)),
                      backgroundColor: MaterialStateProperty.all(Colors.teal),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)
                        )
                      )),
                ),
              ],
            ),

              SizedBox(height: 40,),
            Text('March 2022',style: Theme.of(context).textTheme.headline6,),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                GestureDetector(
                    onTap: (){
                      setState(() {
                        color1=Colors.red;
                        color2=color3=color4=color5=color6=color7=Colors.black;
                      });
                    },
                    child: DateWeekDay(day: 0, weekDay: 0,color: color1,)),
                GestureDetector(
                    onTap: (){
                      setState(() {
                        color2=Colors.red;
                        color1=color3=color4=color5=color6=color7=Colors.black;
                      });
                    },
                    child: DateWeekDay(day: 1, weekDay: 1,color: color2,)),
                GestureDetector(
                    onTap: (){
                      setState(() {
                        color3=Colors.red;
                        color1=color2=color4=color5=color6=color7=Colors.black;
                      });
                    },
                    child: DateWeekDay(day: 2, weekDay: 2,color: color3,)),
                GestureDetector(
                    onTap: (){
                      setState(() {
                        color4=Colors.red;
                        color1=color3=color2=color5=color6=color7=Colors.black;
                      });
                    },
                    child: DateWeekDay(day: 3, weekDay: 3,color: color4,)),
                GestureDetector(
                    onTap: (){
                      setState(() {
                        color5=Colors.red;
                        color1=color3=color4=color5=color2=color7=Colors.black;
                      });
                    },
                    child: DateWeekDay(day: 4, weekDay: 4,color: color5,)),
                GestureDetector(
                    onTap: (){
                      setState(() {
                        color6=Colors.red;
                        color1=color3=color4=color5=color2=color7=Colors.black;
                      });
                    },
                    child: DateWeekDay(day: 5, weekDay: 5,color: color6,)),

              ],
            ),
            SizedBox(height: 5,),
            Column(
              children: [],
            )
            // ListView.builder(
            //   scrollDirection: Axis.horizontal,
            //   itemBuilder: (ctx,i){
            //
            //   return DateWeekDay(day: (DateTime.now().day+i*1.0).toString(), weekDay: (DateTime.now().weekday+i*1.0).toString());
            // },itemCount: 5,)
          ],
        ),
      ),
    );
  }
}


