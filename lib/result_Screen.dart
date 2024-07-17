import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_Summary.dart';

class ResultScreen extends StatelessWidget {
    ResultScreen({super.key, required this.chosenAnswer,required this.restart});
   List<String> chosenAnswer;
   final void Function() restart;
  List<Map<String,Object>> get SummaryData{
         final List<Map<String,Object>> summary=[];
          for(int i=0;i<chosenAnswer.length;i++){
             summary.add(
              {
                'question_index':i,
                'question':questions[i],
                'correct_Answer':questions[i].answers[0],
                'user_answer':chosenAnswer[i],
              }
             );
          }
         
         return summary;   
   }

  @override
  Widget build(BuildContext context) {
    
    final numTotalQuestions=questions.length;
    final numCorrectQuestions=SummaryData.where((data)=>data['correct_Answer']==data['user_answer']).length;
    return  SizedBox(
      width: double.infinity,
      child: Container(
        margin:const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
                  Text('You answer $numCorrectQuestions out $numTotalQuestions questions correctly!',
                  style: TextStyle(color: Color.fromARGB(255, 196, 173, 235),
                  fontSize: 18),),
                 const  SizedBox(height: 30,),
                 QuestionsSummary(SummaryData),
                 const SizedBox(height: 30,),
                 TextButton(onPressed: (){
                  restart();
                 },  child: Text('Restart Quiz',style: TextStyle(
                  color: Color.fromARGB(255, 186, 139, 243)
                 ),))
],
          )
  ));
  }
}