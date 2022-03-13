import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:todo_app/screens/daily_plan_screen.dart';

import '../widgets/active_projects.dart';
import '../widgets/task_action.dart';

class MyHomePageScreen extends StatefulWidget {
  // static const routeArgs='/my_home_page';
  const MyHomePageScreen({Key? key}) : super(key: key);

  @override
  State<MyHomePageScreen> createState() => _MyHomePageScreenState();
}

class _MyHomePageScreenState extends State<MyHomePageScreen> {
  final bool _pinned = true;
  final bool _snap = false;
  final bool _floating = false;

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
            actions: const [
               Align(
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
                    radius: (width/height)*60,
                    lineWidth: 3.0,
                    animation: true,
                    percent: .4,
                    center: Container(
                      padding: const EdgeInsets.all(3),
                      child: CircleAvatar(
                        maxRadius:(width/height)*60-6,
                        minRadius: 10,
                        backgroundImage: const AssetImage('assets/images/user.jpg'),
                      ),
                    ),
                    circularStrokeCap: CircularStrokeCap.round,
                    progressColor: Colors.deepOrange,
                    backgroundColor: Colors.white.withOpacity(0),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15, left: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Text(
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
                        const BorderRadius.vertical(bottom: Radius.circular(30))),
              ),
              expandedTitleScale: 1.8,
              titlePadding: const EdgeInsets.only(left: 20, bottom: 5),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
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
                              child: const Icon(
                                Icons.calendar_today,
                                color: Colors.white,
                                size: 25,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                          onTap: (){
                            Navigator.of(context).pushNamed(DailyPlanScreen.routeArgs);
                          },
                          child: const TasksAction(
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
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const TasksAction(
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
                        const SizedBox(
                          height: 20,
                        ),
                        TasksAction(
                            icon: const Icon(
                              Icons.skip_next_outlined,
                              color: Colors.white,
                              size: 30,
                            ),
                            title: 'Done',
                            currentTasks: 18,
                            taskPosition: 'completed',
                            color: Colors.blue.withOpacity(.8),
                            completed: 18),
                        const SizedBox(
                          height: 30,
                        ),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Active Projects',
                              style: Theme.of(context).textTheme.headline5,
                            )),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            const ActiveProjects(
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
                        const SizedBox(
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
                        const SizedBox(
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

