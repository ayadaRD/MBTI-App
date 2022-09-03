import 'package:flutter/material.dart';
import 'package:mbti/answer.dart';
import 'package:mbti/question_bank.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:mbti/types.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);
  @override
  State<QuizPage> createState() => _QuizPageState();
}

//values of each option
enum state {one, two, three, four, five}

String currentQuestion = '';

int generalQuestionCounter = 1;

state status = state.one;

int questionCounter = 0;

int eScore = 0;
int iScore = 0;

int sScore = 0;
int nScore = 0;

int tScore = 0;
int fScore = 0;

int pScore = 0;
int jScore = 0;


class _QuizPageState extends State<QuizPage> {

  var questionStyle = const TextStyle(color: Color.fromARGB(255, 28, 89, 125), fontSize: 20, );

  //creates button, onPressed go on next question
  ElevatedButton choiceMaker(String text, state value){
    return ElevatedButton(

      style: ElevatedButton.styleFrom(
        backgroundColor: Color.fromARGB(255, 28, 89, 125),
        shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(40.0),),
        side: BorderSide(width: 1.0, color: Colors.white,),
        fixedSize: const Size(300.0, 55.0),
        animationDuration: const Duration(),
      ),

      child: Text(text, textAlign: TextAlign.center,),
      onPressed: (){
        setState(() {
          calculate(value);

          generalQuestionCounter++;

          //i or e
          if(status == state.one){
            //if questions ended
            if(questionCounter == MainBrain().iOrEQuestions.length - 1){
              status = state.two;
              questionCounter = -1;
            }
            else{ questionCounter++; }
          }

          if(status == state.two){
            if(questionCounter == MainBrain().sOrNQuestions.length - 1){
              status = state.three;
              questionCounter = -1;
            }
            else{ questionCounter++; }
          }

          if(status == state.three){
            if(questionCounter == MainBrain().fOrTQuestions.length - 1){
              status = state.four;
              questionCounter = -1;
            }
            else{ questionCounter++; }
          }

          if(status == state.four){
            if(questionCounter == MainBrain().jOrPQuestions.length - 1){
              String type = finalResult();
              questionCounter = 0;
              status = state.one;
              iScore = 0; tScore = 0;
              eScore = 0; fScore = 0;
              sScore = 0; pScore = 0;
              nScore = 0; jScore = 0;
              generalQuestionCounter = 1;

              Alert(
                  context: context,
                  style: const AlertStyle (animationType: AnimationType.grow, animationDuration: Duration(milliseconds: 600),),
                  image: resultImage(type) ,
                  title: "You Are An $type",
                  desc: "we recommend you to read these articles about your type!",
                  buttons: [(resultButton(type)),]
              ).show();

            }
            else{ questionCounter++; }
          }

        });
      },
    );}

  DialogButton resultButton(String type){
    if(type.toString().contains('X')){
      return DialogButton(child: const Text('what is "X" in my results?'), onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => const XPage(),));
      });
    }else{
      return DialogButton(child: Text(type), onPressed: (){
        Navigator.of(context, rootNavigator: true)..pop()..pop();
        Navigator.push(context, MaterialPageRoute(builder: (context) => const Types(),));
      });
    }
  }

  //this function based on user's choice increases the right component
  //in right amount
  void calculate(state value){

    Answer decodedValue = findValue(value);

    //E is upper than I
    if(status == state.one){
      if(decodedValue.location == 1){eScore += decodedValue.amount;}
      else if(decodedValue.location == -1){iScore += decodedValue.amount;}
      else{/*do nothing!*/}
    }

    //S is upper than N
    else if(status == state.two){
      if(decodedValue.location == 1){sScore += decodedValue.amount;}
      else if(decodedValue.location == -1){nScore += decodedValue.amount;}
      else{/*do nothing!*/}
    }

    //T is upper than F
    else if(status == state.three){
      if(decodedValue.location == 1){tScore += decodedValue.amount;}
      else if(decodedValue.location == -1){fScore += decodedValue.amount;}
      else{/*do nothing!*/}
    }

    //J is upper than P
    else{
      if(decodedValue.location == 1){jScore += decodedValue.amount;}
      else if(decodedValue.location == -1){pScore += decodedValue.amount;}
      else{/*do nothing!*/}
    }

  }

  Answer findValue(state value){
    switch(value){

      case state.one:
        return Answer(2, 1);

      case state.two:
        return Answer(1, 1);

      case state.three:
        return Answer(0, 0);

      case state.four:
        return Answer(1, -1);

      case state.five:
        return Answer(2, -1);
    }
  }

  String finalResult(){
    String type = '';

    if(iScore > eScore){type += 'I';}
    else if(iScore < eScore){type += 'E';}
    else{ type += 'X'; }

    if(sScore > nScore){type += 'S';}
    else if(sScore < nScore){type += 'N';}
    else{ type += 'X'; }

    if(fScore > tScore){type += 'F';}
    else if(fScore < tScore){type += 'T';}
    else{ type += 'X'; }

    if(pScore > jScore){type += 'P';}
    else if(pScore < jScore){type += 'J';}
    else{ type += 'X'; }

    return type;
  }

  Image resultImage(String type){

    if(type.contains('X')) {
      return Image.asset('images/think.png',  height: 200, width: 200,);
    }else{
      return Image.asset('images/$type.png', height: 200, width: 200,);
    }
  }

  @override
  Widget build(BuildContext context) {

    if(status == state.one){
      currentQuestion = MainBrain().iOrEQuestions[questionCounter];
    }
    else if(status == state.two){
      currentQuestion = MainBrain().sOrNQuestions[questionCounter];
    }
    else if(status == state.three){
      currentQuestion = MainBrain().fOrTQuestions[questionCounter];
    }
    else{
      currentQuestion = MainBrain().jOrPQuestions[questionCounter];
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 28, 89, 125),
          shadowColor: const Color.fromARGB(255, 37, 144, 203),
          automaticallyImplyLeading: true,
          leading: GestureDetector(
            onTap: (){
              questionCounter = 0;
              generalQuestionCounter = 1;
              status = state.one;
              iScore = 0; tScore = 0;
              eScore = 0; fScore = 0;
              sScore = 0; pScore = 0;
              nScore = 0; jScore = 0;
              Navigator.of(context).pop();
              },
            child: const Icon(Icons.arrow_back, ),
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 28, 89, 125),
        body: SafeArea(
          child: Center(
            child: ListView(

              children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,

                children: [

                  //question
                  Padding(
                    padding: const EdgeInsets.only(right: 30.0, left: 30.0, top:65),
                    child: Container(


                      child: Padding(
                        padding: const EdgeInsets.only(top: 45.0, right: 30, left: 30, bottom: 45),
                        child: Text(currentQuestion, style: questionStyle, textAlign: TextAlign.center,),
                      ),
                      height: 200,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(200, 255, 255, 255),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50.0),
                            bottomRight: Radius.circular(50.0),
                          ),

                      ),
                    ),
                  ),

                  Column(
                    children: [
                      //options
                      const SizedBox(height: 65,),
                      choiceMaker('Agree', state.five),
                      const SizedBox(height: 15,),
                      choiceMaker('Slightly Agree', state.four),
                      const SizedBox(height: 15,),
                      choiceMaker('Not Sure', state.three),
                      const SizedBox(height: 15,),
                      choiceMaker('Slightly Disagree', state.two),
                      const SizedBox(height: 15,),
                      choiceMaker('Disagree', state.one),
                    ],
                  ),
                  const SizedBox(height: 27),
                  Center(child:
                  Text('$generalQuestionCounter of ${MainBrain().iOrEQuestions.length + MainBrain().fOrTQuestions.length + MainBrain().jOrPQuestions.length + MainBrain().sOrNQuestions.length }'
                    ,style: const TextStyle(color: Colors.white, fontSize: 15),
                  ))
                ],
              ),
              ]
            ),
          ),
        ),
      ),
    );
  }
}


class XPage extends StatelessWidget {
  const XPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child:Container (
            child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:const [
                  Text('XXXX?', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold), ),
                  SizedBox(height: 20,),
                  Text('If you got X in your test result, it means that the percent of two component is literally close to each other.\n', style: TextStyle(fontSize: 16), textAlign:  TextAlign.center,),
                  Text('To find out which type you are, we recommend you to read both types.\n', style: TextStyle(fontSize: 16),textAlign:  TextAlign.center),
                  Text('For example if your result is XNFP, it\'s better to read about both ENFP and INFP types and decide which one is more similar to you.\n', style: TextStyle(fontSize: 16), textAlign:  TextAlign.center)
                ],
              ),
            ),
          ),
        ),
      ),
    );





  }
}
