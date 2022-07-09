import 'package:flutter/material.dart';
import 'package:recyclecan/answer.dart';
import 'package:recyclecan/quiz.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = [
      {
        'questionText': 'What is the item made of?',
        'answers': [
          {'text': 'Paper'},
          {'text': 'Plastic'},
          {'text': 'Glass'},
          {'text': 'Metal'},
        ],
      },
      {
        'questionText': 'What type of paper item?',
        'answers': [
          {'text': 'Cardboard boxes'},
          {'text': 'Outer packaging & Tissue box'},
          {'text': 'Egg trays'},
          {'text': 'Envelopes & Flyers'},
          {'text': 'Toilet paper & Paper towel rolls'},
          {'text': 'Newspapers & Books'},
        ],
      }
    ];

  int _questionIndex = 0;


  void _answerQuestion() {
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    } else {
      print('No more questions!');
    }
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Recycle Cans'),
        ),
        body: _questionIndex < _questions.length ? Quiz(
          questions: _questions,
          questionIndex: _questionIndex,
          answerQuestion: _answerQuestion,
        ) : Center(
          child: Text('You\'ve reached the end of the quiz!'),
        ),
      ),
    );
  }
}
