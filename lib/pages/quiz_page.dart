import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:quiz/pages/score_page.dart';
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
  Question currentQuestion;
  Quiz quiz = new Quiz([
    new Question("Elon Musk is human", false),
    new Question("Pizza is healthy", false),
    new Question("Flutter is awesome",true)
  ]);

  String questionText;
  int questionNumber;
  bool isCorrect;
  bool overlayVisible = false;
  int score = 0;

  @override void initState(){
    super.initState();
    currentQuestion = quiz.nextQuestion;
    questionText = currentQuestion.question;
    questionNumber = quiz.questionNumber;
  }
  
  void handleAnswer(bool answer){
    print("answer"+currentQuestion.answer.toString()+" playerAnswer: "+answer.toString());
    isCorrect = (currentQuestion.answer == answer);
    print(isCorrect);
    if(isCorrect) score++;
    quiz.answer(isCorrect);
    this.setState((){
      overlayVisible = true;
    });
  }
  @override
  Widget build(BuildContext context) {
    return new Stack(
      fit:StackFit.expand,
      children: <Widget>[
        new Column(
          
          children: <Widget>[
          new AnswerButton(true, ()=>{this.handleAnswer(true)}), 
          new QuestionText( questionText, questionNumber),
          new AnswerButton(false,()=>{this.handleAnswer(false)})],
        ),
        overlayVisible ? new CorrectWrongOverlay(
          isCorrect, (){
            if(questionNumber == quiz.length) {
               Navigator.of(context).pushAndRemoveUntil(new MaterialPageRoute(builder: (BuildContext context)=> new ScorePage(score, quiz.length)),(Route route)=> route == null);
            }
     
            currentQuestion = quiz.nextQuestion;
            this.setState((){
              overlayVisible = false;
              questionText = currentQuestion.question;
              questionNumber = quiz.questionNumber;
            });
        }) : new Container()
      ],
    );
  }
}
