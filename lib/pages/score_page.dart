import 'package:flutter/material.dart';
import 'package:quiz/pages/landing_page.dart';

class ScorePage extends StatelessWidget {
  int score;
  int questionsTotal;

  ScorePage(this.score, this.questionsTotal);

  @override Widget build(BuildContext context) {
    return new Material(
      color: Colors.blueAccent,
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Text("Your Score: ", style: new TextStyle(color: Colors.white, fontSize: 30.0)),
          new Text(score.toString()+"/"+questionsTotal.toString(), style: new TextStyle(color: Colors.white, fontSize: 40.0)),
          new IconButton(
            icon: new Icon(Icons.arrow_right),
            color: Colors.white,
            iconSize: 50.0,
            onPressed: ()=> Navigator.of(context).pushAndRemoveUntil(new MaterialPageRoute(builder: (BuildContext context)=> new LandingPage()),(Route route)=> route == null);
          )
        ],
      ),
    );
  }
}