import 'package:flutter/material.dart';
import 'package:recyclecan/quiz.dart';
import 'package:recyclecan/recycle_tips.dart';
import 'package:recyclecan/recycle_tips_view.dart';
import 'package:flip_card/flip_card.dart';

void main() {
  runApp(RecycleTips());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  // Index 5 = Congratulations
  // Index 6 = Can not donate la
  final _questions = [
    {
      'questionText': 'What is the item made of?',
      'answers': [
        {'text': 'Paper', 'index': 1},
        {'text': 'Plastic', 'index': 2},
        {'text': 'Glass', 'index': 3},
        {'text': 'Metal', 'index': 4},
        {'text': 'Electronics', 'index': 5},
        {'text': 'Shoes, Clothes & Textiles', 'index': 7},
      ],
    },
    {
      'questionText': 'What type of paper item?',
      'answers': [
        {'text': 'Cardboard boxes', 'index': 5},
        {'text': 'Outer packaging & Tissue box', 'index': 5},
        {'text': 'Egg trays', 'index': 5},
        {'text': 'Envelopes & Flyers', 'index': 5},
        {'text': 'Toilet paper & Paper towel rolls', 'index': 5},
        {'text': 'Newspapers & Books', 'index': 5},
        {'text': 'Others', 'index': 6},
      ],
    },
    {
      'questionText': 'What type of plastic item?',
      'answers': [
        {'text': 'Beverages bottles', 'index': 4},
        {'text': 'Soap bottles', 'index': 4},
        {'text': 'Plastig bags & Plastic wraps', 'index': 4},
        {'text': 'Egg trays', 'index': 4},
        {'text': 'Fruit boxes & Film packaging', 'index': 4},
        {'text': 'Others', 'index': 5},
      ],
    },
    {
      'questionText': 'What type of glass item?',
      'answers': [
        {'text': 'Liquor bottles', 'index': 3},
        {'text': 'Drink bottles', 'index': 3},
        {'text': 'Cosmetics & Medicine bottles', 'index': 3},
        {'text': 'Glass jars', 'index': 3},
        {'text': 'Drinking & Wine glasses', 'index': 3},
        {'text': 'Others', 'index': 4},
      ],
    },
    {
      'questionText': 'What type of metal item?',
      'answers': [
        {'text': 'Beverage cans', 'index': 2},
        {'text': 'Food cans', 'index': 2},
        {'text': 'Metal containers', 'index': 2},
        {'text': 'Old medals', 'index': 2},
        {'text': 'Paint cans', 'index': 2},
        {'text': 'Others', 'index': 3},
      ],
    },
    {
      'questionText': 'What type of electronic item?',
      'answers': [
        {'text': 'Batteries', 'index': 1},
        {'text': 'Large household appliances', 'index': 1},
        {'text': 'Electronic Mobility Device', 'index': 1},
        {'text': 'ICT equipments', 'index': 1},
        {'text': 'Bulbs & Tubes', 'index': 1},
        {'text': 'Others', 'index': 2},
      ],
    },
  ];

  int _questionIndex = 0;

  void _answerQuestion(int index) {
    setState(() {
      _questionIndex = _questionIndex + index;
    });
    if (_questionIndex == 6) {
      () => {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => CongratulationsPage()))
          };
    }
    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    } else {
      print('No more questions!');
    }
  }

  _determinePage() {
    if (_questionIndex == 6) {
      return CongratulationsPage();
    } else {
      return ohNoPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(
        builder: (context) => Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            leading: IconButton(
                icon: Icon(Icons.arrow_back, color: Color(0xFF16c986)),
                onPressed: () {
                  Navigator.pop(context);
                }),
            title: Text('Recycle Cans',
                style: TextStyle(
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF16c986))),
          ),
          body: _questionIndex < _questions.length
              ? Quiz(
                  questions: _questions,
                  questionIndex: _questionIndex,
                  answerQuestion: _answerQuestion,
                )
              : _determinePage(),
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(
        builder: (context) => Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            leading: IconButton(
                icon: Icon(Icons.arrow_back, color: Color(0xFF16c986)),
                onPressed: () {
                  Navigator.pop(context);
                }),
            title: Text('Recycle Cans',
                style: TextStyle(
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF16c986))),
          ),
          body: Center(
            child: ElevatedButton(
              child: Text('Go back to first page'),
              onPressed: () => {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => RecycleTips()))
              },
            ),
          ),
        ),
      ),
    );
  }
}

class RecycleTips extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RecycleTipsState();
}

class _RecycleTipsState extends State<RecycleTips> {
  List<Recycle_tips> _tips = [
    Recycle_tips(
        "Make sure that the things that you want to recycle is dry and clean.",
        "Many communities use single-stream recycling in which all recyclable materials are put into one bin and one single truck. If these recyclables haven’t been rinsed or cleaned out , the trip will ensure that they have likely done enough intermingling as to create a very finemess. Dampness and grease are not good for paper or cardboard recycling. In fact, even a half-filled bottle of soda can ruin an entire load of paper, turning it into nothing more than trash. "),
    Recycle_tips("Combined materials are trash.",
        "Recycling only works when like materials are together. Unfortunately, items like plastic-coated coffee cups, laminated paper and paper-bubble wrap envelopes from the mail can’t ever be separated, which means they’re trash."),
    Recycle_tips("Not all plastics are treated equally.",
        "Rigid plastics are recyclable, labeled by resin codes 1 through 7. Generally, the higher the number, the less recyclable it is. Most recycling centers will recycle plastics 1 and 2 without a problem.Furthermore, a lot of plastic just isn’t recyclable curbside, you can’t recycle plastic bags or films. Additionally, you can’t recycle anything that can tear like paper. That means no cracker bags, chip bags or cereal bags.")
  ];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(
        builder: ((context) => Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.white,
                leading: IconButton(
                    icon: Icon(Icons.arrow_back, color: Color(0xFF16c986)),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
                title: Text('recycleCan',
                    style: TextStyle(
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF16c986))),
              ),
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 250,
                      height: 50,
                    ),
                    Text(
                      'Recycle Tips',
                      style: TextStyle(
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF16c986)),
                    ),
                    SizedBox(
                      width: 250,
                      height: 25,
                    ),
                    SizedBox(
                        width: 250,
                        height: 300,
                        child: FlipCard(
                            front: Recycle_tips_view(
                                text: _tips[_currentIndex].tips),
                            back: Recycle_tips_view(
                                text: _tips[_currentIndex].tip_details))),
                    SizedBox(
                      width: 250,
                      height: 25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        OutlinedButton.icon(
                            onPressed: showPreviousCard,
                            icon: Icon(
                              Icons.chevron_left,
                              color: Color(0xFF16c986),
                            ),
                            label: Text(
                              'Prev',
                              style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF16c986)),
                            )),
                        OutlinedButton.icon(
                            onPressed: showNextCard,
                            icon: Icon(Icons.chevron_right,
                                color: Color(0xFF16c986)),
                            label: Text(
                              'Next',
                              style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF16c986)),
                            )),
                      ],
                    ),
                    SizedBox(
                      width: 250,
                      height: 30,
                    ),
                    OutlinedButton(
                      onPressed: () => {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => MyApp()))
                      },
                      child: Text(
                        'Questionnaire',
                        style: TextStyle(
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF16c986)),
                      ),
                    ),
                    SizedBox(
                      width: 250,
                      height: 30,
                    ),
                  ],
                ),
              ),
            )),
      ),
    );
  }

  void showNextCard() {
    setState(() {
      _currentIndex =
          (_currentIndex + 1 < _tips.length) ? _currentIndex + 1 : 0;
    });
  }

  void showPreviousCard() {
    setState(() {
      _currentIndex =
          (_currentIndex - 1 >= 0) ? _currentIndex - 1 : _tips.length - 1;
    });
  }
}

class CongratulationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Congratulations! The item can be recycled!',
                style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 16,
                    color: Color(0xFF16c986))),
            Text('Please, proceed to the nearest blue recycle bin ',
                style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 16,
                    color: Color(0xFF16c986))),
            Text('and put the item in it.',
                style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 16,
                    color: Color(0xFF16c986))),
            Image.network(
                'https://cdn-cms.pgimgs.com/static/2020/11/nea-recycling-bin-1024x682.jpg'),
            ElevatedButton(
              onPressed: () => {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => RecycleTips()))
              },
              child: Text('Go back to homepage'),
            )
          ],
        ),
      ),
    );
  }
}

class ohNoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('oh no, the item can\'t be recycled!',
                style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 16,
                    color: Color(0xFF16c986))),
            Image.network(
                'https://i.kym-cdn.com/entries/icons/original/000/024/027/blog_image_3822_4926_Webcomic_Name_April_Fools_Day_201703231756.jpg'),
            ElevatedButton(
              onPressed: () => {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => RecycleTips()))
              },
              child: Text('Go back to homepage'),
            )
          ],
        ),
      ),
    );
  }
}
