import 'package:flutter/material.dart';
import './answer.dart';
import './question.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final Function answerQuestion;

  Quiz(
      {@required this.questions,
      @required this.questionIndex,
      @required this.answerQuestion});

  @override
  Widget build(BuildContext context) {
    return Column(
      // primary: false,
      // padding: EdgeInsets.all(10),
      // crossAxisSpacing: 10,
      // mainAxisSpacing: 10,
      // crossAxisCount: 2,
      children: <Widget>[
        Question(
          questions[questionIndex]['questionText'],
        ),
        Expanded(
          child: GridView.count(
            primary: false,
            padding: EdgeInsets.all(10),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 2,
            children: [
              ...(questions[questionIndex]['answers']
                      as List<Map<String, Object>>)
                  .map((answer) {
                return Answer(answer['text'], () => answerQuestion());
              }).toList()
            ],
          ),
        ),
        OutlinedButton(onPressed: () {}, child: Text('Next Question')),
      ],
    );
  }
}
