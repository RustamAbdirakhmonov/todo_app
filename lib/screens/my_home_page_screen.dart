import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class MyHomePageScreen extends StatefulWidget {
  // static const routeArgs='/my_home_page';
  const MyHomePageScreen({Key? key}) : super(key: key);

  @override
  State<MyHomePageScreen> createState() => _MyHomePageScreenState();
}

class _MyHomePageScreenState extends State<MyHomePageScreen> {
  bool _pinned = true;
  bool _snap = false;
  bool _floating = false;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            leading: const Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.menu_outlined,
                    color: Colors.black,
                  ),
                )),
            shadowColor: Colors.black,
            backgroundColor: Colors.white,
            pinned: _pinned,
            snap: _snap,
            floating: _floating,
            expandedHeight: height * .24,
            toolbarHeight: height * .11,
            actions: [
              const Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.search_outlined,
                      color: Colors.black,
                    ),
                  )),
            ],
            flexibleSpace: FlexibleSpaceBar(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  CircularPercentIndicator(
                    radius: width * .09,
                    lineWidth: 5.0,
                    animation: true,
                    percent: .4,
                    center: Container(
                      padding: EdgeInsets.all(3),
                      child: CircleAvatar(
                        maxRadius: 25,
                        minRadius: 10,
                        backgroundImage: AssetImage('assets/images/user.jpg'),
                      ),
                    ),
                    circularStrokeCap: CircularStrokeCap.round,
                    progressColor: Colors.deepOrange,
                    
                  ),

                  Padding(
                    padding: EdgeInsets.only(bottom: 15, left: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Philip Mccoy',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                        ),
                        Text(
                          'Project Manager',
                          style: TextStyle(
                              color: Colors.black.withOpacity(.7),
                              fontSize: 16,
                              fontWeight: FontWeight.w300),
                        )
                      ],
                    ),
                  )
                ],
              ),
              background: Container(
                decoration: BoxDecoration(
                    color: Colors.deepOrange.withOpacity(.8),
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(30))),
              ),
              expandedTitleScale: 1.8,
              titlePadding: EdgeInsets.only(left: 20, bottom: 5),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.only(top: 15, left: 15, right: 15),
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'My tasks',
                              style: Theme.of(context).textTheme.headline5,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: Colors.teal,
                              ),
                              width: 50,
                              height: 50,
                              child: Icon(
                                Icons.calendar_today,
                                color: Colors.white,
                                size: 25,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TasksAction(
                            icon: Icon(
                              Icons.schedule_outlined,
                              color: Colors.white,
                              size: 30,
                            ),
                            title: 'To Do',
                            currentTasks: 5,
                            taskPosition: 'started',
                            color: Colors.red,
                            completed: 1),
                        SizedBox(
                          height: 20,
                        ),
                        TasksAction(
                            icon: Icon(
                              Icons.wb_sunny_outlined,
                              color: Colors.white,
                              size: 30,
                            ),
                            title: 'In Progress',
                            currentTasks: 1,
                            taskPosition: 'started',
                            color: Colors.orange,
                            completed: 1),
                        SizedBox(
                          height: 20,
                        ),
                        TasksAction(
                            icon: Icon(
                              Icons.skip_next_outlined,
                              color: Colors.white,
                              size: 30,
                            ),
                            title: 'Done',
                            currentTasks: 18,
                            taskPosition: 'completed',
                            color: Colors.blue.withOpacity(.8),
                            completed: 18),
                        SizedBox(
                          height: 30,
                        ),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Active Projects',
                              style: Theme.of(context).textTheme.headline5,
                            )),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            ActiveProjects(
                                color: Colors.teal,
                                projectTitle: 'Medical App',
                                progress: 9,
                                percentage: .25),
                            ActiveProjects(
                                color: Colors.red.withOpacity(.8),
                                projectTitle: 'Sports App',
                                progress: 9,
                                percentage: .75),
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            ActiveProjects(
                                color: Colors.deepOrange.withOpacity(.6),
                                projectTitle: 'Rent App',
                                progress: 9,
                                percentage: .60),
                            ActiveProjects(
                                color: Colors.blue.withOpacity(.8),
                                projectTitle: 'Banking App',
                                progress: 9,
                                percentage: .48),
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        )
                      ],
                    ),
                  ),
                );
              },
              childCount: 1,
            ),
          )
        ],
        scrollDirection: Axis.vertical,
      ),
    );
  }
}

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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Align(
            alignment: Alignment.topCenter,
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
