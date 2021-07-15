import 'package:flutter/material.dart';
import 'package:quiz_app/model/question.dart';

void main() => runApp(MaterialApp(
      home: QuizApp(),
    ));

class QuizApp extends StatefulWidget {
  const QuizApp({Key? key}) : super(key: key);

  @override
  _QuizAppState createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  int index = 0;
  List questionText = [
    Question.name("Is 101 palindrome?", true),
    Question.name("Is 234 palindrome?", false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Quiz"),
          centerTitle: true,
          backgroundColor: Colors.black,
          elevation: 3.0,
        ),
        backgroundColor: Colors.blueGrey,
        body: Builder(
          builder: (BuildContext context) => Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Center(
                  child: Image.asset(
                    "assets/google-quiz.jpg",
                    width: 250.0,
                    height: 180.0,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.indigo[500],
                      borderRadius: BorderRadius.circular(300.6),
                      border: Border.all(
                          color: Colors.black, style: BorderStyle.solid)),
                  height: 100.0,
                  width: 200.0,
                  child: Center(
                    child: Text(
                      questionText[index].questionText,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    FloatingActionButton(
                      onPressed: () => _checkAnswer(true, context),
                      focusColor: Colors.indigo[200],
                      child: Text("TRUE"),
                    ),
                    FloatingActionButton(
                      onPressed: () => _checkAnswer(false, context),
                      focusColor: Colors.indigo[200],
                      child: Text("FALSE"),
                    ),
                    FloatingActionButton(
                      onPressed: () => _nextQuestion(),
                      focusColor: Colors.indigo[200],
                      child: Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ));
  }

  _checkAnswer(bool userchoice, BuildContext context) {
    if (userchoice == questionText[index].isCorrect) {
      final snackbar = SnackBar(content: Text("CORRECT!"));
      //ignore:deprecated_member_use
      Scaffold.of(context).showSnackBar(snackbar);
      debugPrint("YES CORRECT");
    } else {
      debugPrint("OOPS INCORRECT!");
      final snackbar = SnackBar(content: Text("OOPS INCORRECT!"));
      //ignore:deprecated_member_use
      Scaffold.of(context).showSnackBar(snackbar);
    }
  }

  _nextQuestion() {
    setState(() {
      index = (index + 1) % questionText.length;
    });
  }
}
