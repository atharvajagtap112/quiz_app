import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/result_Screen.dart';
import 'package:quiz_app/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
   
  @override
  State<Quiz> createState() => _QuizState();
}
  
class _QuizState extends State<Quiz> {
  List<String> selectedAnswer=[];
 var activeScreen="Start-Screen";
     @override
  // void initState() {
  //  activeScreen= StartScreen(switchScreen);
  //   super.initState();
  // }
  void switchScreen(){
    setState(() {
      activeScreen="Questions-Screen"; 
    });
  } 
  void chooseAnswer(String answer){
    selectedAnswer.add(answer);
    if(selectedAnswer.length==questions.length){
      setState(() {
       
        activeScreen="Result-Screen";
      });
    }
  }
  void restart(){
    setState(() {
      selectedAnswer=[];
      activeScreen='Questions-Screen';
    });
  }
  
  @override
  Widget build(BuildContext context) {
    Widget ScreenWidget=StartScreen(switchScreen);
    if(activeScreen=="Questions-Screen"){
      ScreenWidget=QuestionsScreen(
        onSelectAnswer: chooseAnswer);
}
if(activeScreen=="Result-Screen"){
   ScreenWidget=  ResultScreen(chosenAnswer:selectedAnswer,restart: restart,);
}
    return  MaterialApp(
      home: Scaffold(
        body:  Container(
           decoration: const BoxDecoration(
           gradient: LinearGradient(
            colors:[Color.fromARGB(255, 55, 0, 101),
                    Color.fromARGB(255, 128, 1, 232)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomLeft )),

        child: ScreenWidget,
        ),
      ),
    ); 
  }
}