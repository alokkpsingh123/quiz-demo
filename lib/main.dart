import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int questionNumber = 0;
  int currentScore = 0;
  Questions questions = Questions();

  void updateQuestionNumber() {
    setState(() {
      questionNumber = questionNumber + 1;
      print("$questionNumber");
    });
  }

  void updateCurrentScore(bool choice, int question_number) {
    if (questions.questionBank.length == question_number) {
      print("End of questions");
    } else {
      if (questions.questionBank[question_number].answer == choice) {
        setState(() {
          currentScore++;
        });
      }
    }
  }

  bool checkQuestionNumber(int questionNumber) {
    return questionNumber < questions.questionBank.length ? true : false;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: const Text("Quiz App"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 20.0,),
          Center(
            child: Text(
              checkQuestionNumber(questionNumber)? questions.questionBank[questionNumber].questionText.toString():"End",
              style: TextStyle(fontSize: 40.0),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                if(questionNumber == questions.questionBank.length){
                  print("End of questions");
                }else{
                  updateCurrentScore(true, questionNumber);
                  updateQuestionNumber();
                }
              });
            },
            child: Text("True"),
          ),
          SizedBox(
            height: 20.0,
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                if(questionNumber == questions.questionBank.length){
                  print("End of questions");
                }else{
                  updateCurrentScore(false, questionNumber);
                  updateQuestionNumber();
                }
              });
            },
            child: Text("False"),
          ),
          SizedBox(
            height: 100.0,
          ),
          SizedBox(
            height: 50.0,
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Center(
              child: Text(
                "Current Score is:",
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Center(
              child: Text(
                "$currentScore",
                style: TextStyle(fontSize: 30),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}

class Question {
  late final String questionText;
  late final bool answer;

  Question({required this.questionText, required this.answer});
}

class Questions {
  List<Question> questionBank = [
    Question(questionText: "Question 1", answer: true),
    Question(questionText: "Question 2", answer: true),
    Question(questionText: "Question 3", answer: false),
    Question(questionText: "Question 4", answer: true),
    Question(questionText: "Question 5", answer: false),
    Question(questionText: "Question 6", answer: false),
  ];
}
