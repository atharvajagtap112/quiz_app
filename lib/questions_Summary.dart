import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
   QuestionsSummary(this.summaryData,{super.key});
      List<Map<String,Object>> summaryData;
  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: 
               summaryData.map((data){
                 return Row(
                  children: [
                      Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),
                      color: Color.fromARGB(255, 162, 2, 248)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                          child: Text(((data['question_index'] as int)+1).toString(),style: TextStyle(fontSize:18 ),),
                        )),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical:8,horizontal: 12),
                          child: Column(
                             
                            children: [
                              Text(data['question'].toString(),style: TextStyle(color: const Color.fromARGB(255, 255, 255, 255),fontSize: 15),),
                              SizedBox(height: 5,),
                              Text(data['correct_Answer'].toString(),style:TextStyle(color: Color.fromARGB(158, 238, 30, 231))),
                              Text(data['user_answer'].toString(),style:TextStyle(color: Color.fromARGB(255, 235, 180, 233)))
                            ],
                          ),
                        ),
                      )
                  ],
                 );
               }).toList(),
          
        ),
      ),
    );
  }
}