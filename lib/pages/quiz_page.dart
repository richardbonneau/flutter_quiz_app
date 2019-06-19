import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import '../utils/question.dart';
import '../utils/quiz.dart';
import '../ui/answer_button.dart';
import '../ui/question_text.dart';
import '../ui/correct_wrong_overlay.dart';

class QuizPage extends StatefulWidget {
  @override
  State createState() => new QuizPageState();
}

class QuizPageState extends State<QuizPage> {
  @override
  Widget build(BuildContext context) {
    return new Stack(
      fit:StackFit.expand,
      children: <Widget>[
        new Column(
          
          children: <Widget>[
          new AnswerButton(true, ()=>{print("You answered true")}), 
          new QuestionText( "What is a cat?", 1),
          new AnswerButton(false,()=>{print("You answered false")})],
        ),
        new CorrectWrongOverlay(false)
      ],
    );
  }
}
