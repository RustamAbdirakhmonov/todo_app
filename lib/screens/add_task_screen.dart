import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../widgets/elevated_button.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({Key? key}) : super(key: key);
  static const routeArgs = '/addTask';

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  DateTime selectedDate = DateTime.now();
  var title = TextEditingController();
  var dateTime = TextEditingController();
  var description = TextEditingController();
  DateTime date = DateTime.now();
  int _value = 1;
  bool button1=false;
  bool button2=false;
  bool button3=false;
  bool button4=false;
  bool button5=false;

  void _prees(int index){
    if(index==1){
      setState(() {
        bool button2=false;
        bool button3=false;
        bool button4=false;
        bool button5=false;
      });
    } else if(index==2){
      setState(() {
        bool button1=false;
        bool button3=false;
        bool button4=false;
        bool button5=false;
      });
    }else if(index==3){
      setState(() {
        bool button1=false;
        bool button2=false;
        bool button4=false;
        bool button5=false;
      });

    }else if(index==4){
      setState(() {
        bool button1=false;
        bool button3=false;
        bool button2=false;
        bool button5=false;
      });
    }else if(index==5){
      setState(() {
        bool button1=false;
        bool button3=false;
        bool button4=false;
        bool button2=false;
      });
    }
  }


  Future<Null> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      initialDatePickerMode: DatePickerMode.day,
      firstDate: date,
      lastDate: date.add(
        Duration(days: 6),
      ),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: Color.fromRGBO(233, 190, 124, 1),
              // header background color
              onPrimary: Colors.black,
              // header text color
              onSurface: Colors.black, // body text color
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                primary: Colors.red, // button text color
              ),
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null)
      setState(() {
        selectedDate = picked;
        dateTime.text = DateFormat('EEE d MMMM').format(selectedDate);
      });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.pink.shade50,
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(15),
              width: width,
              height: height * .4,
              decoration: BoxDecoration(
                color: Color.fromRGBO(233, 190, 124, 1),
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(30)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Create new task',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 35),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: title,
                    validator: (value) {
                      value!.isEmpty ? 'Please fill the title' : null;
                    },
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      hintText: 'Enter task title',
                      labelText: 'title',
                      border: UnderlineInputBorder(
                          borderSide: BorderSide(
                        color: Colors.red,
                        width: 2,
                        style: BorderStyle.solid,
                      )),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      SizedBox(
                        child: TextFormField(
                          controller: dateTime,
                          decoration: InputDecoration(
                              labelText: 'Date', hintText: 'Enter the Date'),
                        ),
                        width: width * .7,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 10),
                        height: 70,
                        child: ElevatedButton(
                          onPressed: () => _selectDate(context),
                          child: Icon(
                            Icons.calendar_today_outlined,
                            color: Colors.white,
                            size: 30,
                          ),
                          style: ButtonStyle(
                              padding:
                                  MaterialStateProperty.all(EdgeInsets.all(5)),
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.teal),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100),
                              ))),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            Container(
              width: width,
              height: height * .6,
              child: ListView(
                padding: EdgeInsets.only(left: 15, right: 15),
                scrollDirection: Axis.vertical,
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'start time',
                            style: TextStyle(
                                color: Colors.black.withOpacity(.3),
                                fontSize: 16),
                          ),
                          Container(
                              width: width * .4,
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          width: 1, color: Colors.grey))),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    DateFormat('hh:mm').format(date),
                                    style: TextStyle(
                                        fontSize: 25,
                                        color: Colors.black.withOpacity(.8)),
                                  ),
                                  DropdownButton(
                                    icon: Icon(
                                      Icons.keyboard_arrow_down_outlined,
                                      size: 30,
                                      color: Colors.grey,
                                    ),
                                    dropdownColor: Colors.pink.shade50,
                                    elevation: 0,
                                    value: _value,
                                    style: TextStyle(
                                        color: Colors.black.withOpacity(.6),
                                        fontSize: 25),
                                    underline: DropdownButtonHideUnderline(
                                        child: Container()),
                                    items: [
                                      DropdownMenuItem(
                                        child: Text(
                                          'AM',
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                        value: 1,
                                      ),
                                      DropdownMenuItem(
                                        child: Text('PM',
                                            style:
                                                TextStyle(color: Colors.grey)),
                                        value: 2,
                                      ),
                                    ],
                                    onChanged: (_) {
                                      setState(() {
                                        _value = 2;
                                      });
                                    },
                                  )
                                ],
                              )),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'start time',
                            style: TextStyle(
                                color: Colors.black.withOpacity(.3),
                                fontSize: 16),
                          ),
                          Container(
                              width: width * .4,
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          width: 1, color: Colors.grey))),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    DateFormat('hh:mm').format(date),
                                    style: TextStyle(
                                        fontSize: 25,
                                        color: Colors.black.withOpacity(.8)),
                                  ),
                                  DropdownButton(
                                    dropdownColor: Colors.pink.shade50,
                                    elevation: 0,
                                    value: _value,
                                    icon: Icon(
                                      Icons.keyboard_arrow_down_outlined,
                                      size: 30,
                                      color: Colors.grey,
                                    ),
                                    style: TextStyle(
                                        color: Colors.black.withOpacity(.6),
                                        fontSize: 25),
                                    underline: DropdownButtonHideUnderline(
                                        child: Container()),
                                    items: [
                                      DropdownMenuItem(
                                        child: Text(
                                          'AM',
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                        value: 1,
                                      ),
                                      DropdownMenuItem(
                                        child: Text('PM',
                                            style:
                                                TextStyle(color: Colors.grey)),
                                        value: 2,
                                      ),
                                    ],
                                    onChanged: (_) {
                                      setState(() {
                                        _value = 2;
                                      });
                                    },
                                  )
                                ],
                              )),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    maxLines: 10,
                    minLines: 5,
                    decoration: InputDecoration(
                      labelStyle: TextStyle(
                          color: Colors.black.withOpacity(.6), fontSize: 18),
                      labelText: 'description',
                      hintText: 'Enter description of task',
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Categories',
                    style: TextStyle(
                        color: Colors.black.withOpacity(.6), fontSize: 18),
                  ),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: <Widget>[
                 ElevatedButtonStyle(text: 'SPORTS APP'),
                     ElevatedButtonStyle(text: 'MEDICAL APP'),
                     ElevatedButtonStyle(text: 'RENT APP'),


                   ],
                 ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                       ElevatedButtonStyle(text: 'BANKING APP'),
                      SizedBox(width: 10,),
                      ElevatedButtonStyle(text: 'GAMING PLATFORM APP'),


                    ],
                  ),
                 ElevatedButton(onPressed: (){}, child: Text('Create Task',style: TextStyle(color: Colors.white),textAlign: TextAlign.center,),style: ButtonStyle(
                   backgroundColor: MaterialStateProperty.all(Colors.blueAccent),
                   shape:MaterialStateProperty.all<RoundedRectangleBorder>(
                     RoundedRectangleBorder(
                       borderRadius: BorderRadius.circular(30)
                     )
                   ),
                   padding: MaterialStateProperty.all(EdgeInsets.only(left: 30,right: 30,top: 5,bottom: 5)),
                   elevation:MaterialStateProperty.all(0),

                 ),)


                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

