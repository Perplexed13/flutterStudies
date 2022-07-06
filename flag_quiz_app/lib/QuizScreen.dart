import 'dart:collection';

import 'package:flag_quiz_app/Flagsdao.dart';
import 'package:flag_quiz_app/ResultScreen.dart';

import 'package:flutter/material.dart';

import 'Flags.dart';


class QuizScreen extends StatefulWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {

  var questions = <Flags>[];
  var wrongAnswers = <Flags>[];
  Flags? correctQuestion = null;
  var allChoices = HashSet<Flags>();
  
  int questionCount = 0;
  int correctCount = 0; 
  int incorrectCount = 0;

  String flagName = "placeholder.png";
  String buttonA = "";
  String buttonB = "";
  String buttonC = "";
  String buttonD = "";

  @override
  void initState() {
    super.initState();
    getQuestions();
  }

  Future<void> getQuestions() async {
    questions = await Flagsdao().get10Random();
  }

  Future<void> installQuestions() async{
    correctQuestion = questions[questionCount];

    flagName = correctQuestion!.flag_resim;

    wrongAnswers = await Flagsdao().get3Incorrect(correctQuestion!.flag_id);

    allChoices.clear();
    allChoices.add(correctQuestion!);
    allChoices.add(wrongAnswers[0]);
    allChoices.add(wrongAnswers[1]);
    allChoices.add(wrongAnswers[2]);

    buttonA = allChoices.elementAt(0).flag_ad;
    buttonB = allChoices.elementAt(1).flag_ad;
    buttonC = allChoices.elementAt(2).flag_ad;
    buttonD = allChoices.elementAt(3).flag_ad;

    setState(() {});
  }

  void questionCountControl(){
    questionCount = questionCount + 1;

    if(questionCount != 10){
      installQuestions();
    }else{
      Navigator.pushReplacement(context, MaterialPageRoute(builder : (context) => ResultScreen(correctCount)));
    }
  }

  void correctControl(String buttonX) {
    if(correctQuestion!.flag_ad == buttonX){
      correctCount += 1;
    }else{
      incorrectCount += 1;
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
   
        title: const Text("Quiz Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Correct: $correctCount",style: const TextStyle(fontSize: 18),),
                Text("Incorrect: $incorrectCount",style: const TextStyle(fontSize: 18),),
              ],
            ),
            questionCount !=10 ? Text("Question ${questionCount+1}.",style: const TextStyle(fontSize: 25),) : 
            const Text("Question 10.",style: TextStyle(fontSize: 25),),
            Image.asset("lib/picture/$flagName"),
            SizedBox(
              width: 250,
              height: 50,
              child: ElevatedButton(
                child: Text(buttonA),
                onPressed: (){
                  correctControl(buttonA);
                  questionCountControl();
                },
              ),
            ),
            SizedBox(
              width: 250,
              height: 50,
              child: ElevatedButton(
                child: Text(buttonB),
                onPressed: (){
                  correctControl(buttonB);
                  questionCountControl();
                },
              ),
            ),
            SizedBox(
              width: 250,
              height: 50,
              child: ElevatedButton(
                child: Text(buttonC),
                onPressed: (){
                  correctControl(buttonC);
                  questionCountControl();
                },
              ),
            ),
            SizedBox(
              width: 250,
              height: 50,
              child: ElevatedButton(
                child: Text(buttonD),
                onPressed: (){
                  correctControl(buttonD);
                  questionCountControl();
                },
              ),
            ),
          ],
          
        ),
      ),
    );
    
  }
}