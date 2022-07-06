import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class ResultScreen extends StatefulWidget {
  int correctAnswer;

  ResultScreen({required this.correctAnswer});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
   
        title: Text("Result Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("${widget.correctAnswer} CORRECT ${10-widget.correctAnswer} INCORRECT",style: TextStyle(fontSize: 25),),
            Text("${widget.correctAnswer*100/10.toInt()}% SUCCESS",style: TextStyle(fontSize: 25,color:Colors.red)),
            SizedBox(
              width: 250,
              height: 50,
              child: ElevatedButton(
                child: Text("PLAY AGAIN"),
                onPressed: (){
                  Navigator.pop(context);
                },
              ),
            ),
          ],
          
        ),
      ),
    );
  }
}