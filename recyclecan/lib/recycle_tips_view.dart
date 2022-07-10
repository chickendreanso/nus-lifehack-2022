import 'package:flutter/material.dart';

class Recycle_tips_view extends StatelessWidget {
  final String text;

  Recycle_tips_view({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Center(
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(fontFamily: 'Roboto', color: Color(0xFF16c986)),
        ),
      ),
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Color(0xFF16c986), width: 1),
        borderRadius: BorderRadius.circular(10),
      ),
      borderOnForeground: true,
    );
  }
}
