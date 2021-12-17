import 'package:flutter/material.dart';
import './clothing_question.dart';
import './clothing_answer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void _iWasTapped() {
    setState(() {
      _questionIndex += 1;
      if (_questionIndex > 2) _questionIndex = 0;
    });
  }

  var questions = [
    {
      'question': 'Select Clothing',
      'answer': ['Hoodies', 'T-Shirts', 'Jeans']
    },
    {
      'question': 'Select Color',
      'answer': ['Blue', 'Orange', 'Green']
    },
    {
      'question': 'Select Size',
      'answer': ['XS', 'S', 'M', 'L', 'XL']
    },
  ];

  var _questionIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MIS Lab 2',
      home: Scaffold(
          appBar: AppBar(
            title: const Text("MIS Lab 2"),
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 40.0),
                child: ClothingQuestion(questions[_questionIndex]['question'] as String),
              ),
              ...(questions[_questionIndex]['answer'] as List<String>)
                  .map((answer) {
                return Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: ClothingAnswer(_iWasTapped, answer),
                );
              }),
            ],
          )),
    );
  }
}
