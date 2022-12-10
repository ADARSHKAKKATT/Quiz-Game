import 'package:flutter/material.dart';
import 'package:quizapp/model%20class.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
      home: const Quiz()
  )
  );
}
Myquestion q=Myquestion();
class Quiz extends StatefulWidget {
  const Quiz({Key? key}) : super(key: key);

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {

  int questionnumber=0;
  List<Icon> symbol=[];


  List<Myquestion> questionBank=[
    Myquestion(q:"elephant have black horn",a:false),
    Myquestion (q:"china is neighbour country of india",a:true),
    Myquestion (q:"There are 4 lungs in the human body",a:false),
    Myquestion (q:"Jackfruit is a vegitable",a:false),
    Myquestion (q:"2435*34*0=43526",a:false),
  ];

  void nextquestion(){
    if(questionnumber<questionBank.length-1){
      questionnumber++;
    }
  }

  String? questionText(){
    return questionBank[questionnumber].question;
  }
  bool? correctanswer(){
    return questionBank[questionnumber].answer;
  }
  bool finished(){
    if(questionnumber==questionBank.length-1){
      // print("Finished");
      return true;
    }
    else{
      // print("else");
      return false;
    }
  }
  int reset(){
    return questionnumber=0;
  }

  void checkAnswer(bool userPickedAnswer){
     bool? ans=correctanswer();
    setState(() {
      if(finished()==true){
        // print("success");
        Alert(context: context,
        title: 'Finished !!!',
        desc: 'Reach end of Quiz',).show();
        reset();
        symbol=[];
      }
      else{
        if(userPickedAnswer==correctanswer()){
          symbol.add(Icon(Icons.check,color: Colors.green,size: 50,),);
          print("true");
        }
        else{
          symbol.add(Icon(Icons.close,color: Colors.red,size: 50,),);
          print("false");
        }
        nextquestion();
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              Container(
                height: 350,
                child: Center(
                  child: Text("${questionBank[questionnumber].question} ",style: TextStyle(color: Colors.white,fontSize: 30),
                  ),
                ),
              ),

              Column(
                children: [
                  GestureDetector(
                    onTap: (){
                      // Alert(context: context, title: "WRONG !!!", desc: "").show();
                      setState(() {
                        checkAnswer(true);
                        if(questionBank[questionnumber].answer==true){

                        }
                      });

        },
                    child: Container(height: 60,
                      decoration: BoxDecoration(color: Colors.green),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("True",style: TextStyle(color: Colors.white,fontSize: 20),
                        ),
                      ],
                    ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        checkAnswer(false);
                        if(questionBank[questionnumber].answer==false){

                        }

                      });
                    },
                    child: Container(height: 60,
                      decoration: BoxDecoration(color: Colors.red),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("False",style: TextStyle(color: Colors.white,fontSize: 20),)
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Row(
                    children:
                      symbol,
                 ),
                ],
              ),
            ],
          ),
        ),
    );
  }
}
