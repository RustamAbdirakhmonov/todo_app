import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({Key? key}) : super(key: key);
  static const routeArgs = '/addTask';

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  DateTime selectedDate=DateTime.now();
  var title = TextEditingController();
  var dateTime = TextEditingController();
  Future<Null> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime(DateTime.now().day),
        lastDate: DateTime(DateTime.now().add(Duration(days: 6).))

    );
    if (picked != null)
      setState(() {
        selectedDate = picked;
        dateTime.text = DateFormat.yMd().format(selectedDate);
      });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.pink.shade50,
      body: Container(

        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(15),
              width: width,
              height: height * .4,
              decoration: BoxDecoration(
                color: Colors.deepOrange,
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(30)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 20,),
                  Text(
                    'Create new task',
                    style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 35),
                  ),
                  SizedBox(height: 10,),
                  TextFormField(
                    controller: title,
                    validator: (value){
                      value!.isEmpty?'Please fill the title':null;
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
                        )
                      ),


                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      SizedBox(

                        child: TextFormField(
                          controller: dateTime,
                        decoration: InputDecoration(
                          labelText: 'Date',
                          hintText: 'Enter the Date'
                        ),
                        ),
                        width: width*.7,
                      ),
                      SizedBox(width: 5,),
                      Container(
                        padding: EdgeInsets.only(top: 10),
                        height: 70,
                        child: ElevatedButton(onPressed: ()=>_selectDate(context), child: Icon(Icons.calendar_today_outlined,color: Colors.white,size: 30,),style: ButtonStyle(
                            padding: MaterialStateProperty.all(EdgeInsets.all(5)),
                            backgroundColor: MaterialStateProperty.all(Colors.teal),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(

                            borderRadius: BorderRadius.circular(100),
                          )
                        )),),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
