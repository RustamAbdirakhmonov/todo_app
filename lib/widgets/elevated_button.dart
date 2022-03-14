import 'package:flutter/material.dart';
class ElevatedButtonStyle extends StatefulWidget {
  ElevatedButtonStyle({Key? key,required this.text}) : super(key: key);
  String text;
  @override
  State<ElevatedButtonStyle> createState() => _ElevatedButtonStyleState();
}

class _ElevatedButtonStyleState extends State<ElevatedButtonStyle> {
  bool button4=false;
  @override
  Widget build(BuildContext context) {
    return  ElevatedButton(
      onPressed: () {
        setState(() {
          button4=!button4;
        });
      },
      child: Text(widget.text),
      style: ButtonStyle(
          foregroundColor: button4?MaterialStateProperty.all(Colors.grey):MaterialStateProperty.all(Colors.red),
          backgroundColor: button4?MaterialStateProperty.all(Colors.red):MaterialStateProperty.all(Colors.grey.withOpacity(.5)),
          elevation: MaterialStateProperty.all(0),
          shape: MaterialStateProperty.all<
              RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)
              )
          )),
    );
  }
}

