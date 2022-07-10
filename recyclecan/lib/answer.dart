import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final String description;
  final Function selectHandler;

  Answer(this.description, this.selectHandler);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 125,
      height: 125,
      margin: EdgeInsets.all(10),
      child: Card(
        child: new InkWell(
          onTap: selectHandler,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
              Image.network(
                  'https://i.kym-cdn.com/entries/icons/original/000/013/564/doge.jpg'),
              Text(
                description,
                style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 16,
                    color: Color(0xFF16c986)),
                textAlign: TextAlign.center,
              ),
            ]),
          ),
        ),
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Color(0xFF16c986), width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        borderOnForeground: true,
        elevation: 5,
        shadowColor: Color(0xFF16C986),
      ),
    );
  }
}
