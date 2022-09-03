import 'package:flutter/material.dart';
import 'package:mbti/quiz_page.dart';
import 'package:mbti/mbti_info.dart';
import 'package:mbti/sources.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:mbti/types.dart';
import 'package:mbti/about_me.dart';

void main() {
  runApp(const MBTI());
}

class MBTI extends StatefulWidget {
  const MBTI({Key? key}) : super(key: key);

  @override
  State<MBTI> createState() => _MBTIState();
}

class _MBTIState extends State<MBTI> {
  Builder menuButtonCreator (String name){
    return Builder(
      builder: (context) {
        return ElevatedButton(

          style:  ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 28, 89, 125),
            shape:  RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0),),
            side: const BorderSide(width: 1.0, color: Colors.white,),
            fixedSize: const Size(100.0, 50.0),
          ),

          onPressed: (){

              switch(name){
                case 'Test':
                  Alert(
                    context: context,
                    style: const AlertStyle(
                      descStyle:  TextStyle(fontSize: 18),),
                    type: AlertType.info,
                    title: 'Attention!',
                    desc: '\n- Choose carefully! there is no way back to previous question.\n\n- Don\'t use "Not Sure" option as much as you can, it\'s better for your results.',
                    buttons: [
                      DialogButton(child: const Text('Take The Test!', style: TextStyle(color: Colors.white),), onPressed: (){
                        Navigator.of(context).pop();
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const QuizPage()),);
                      })
                    ],
                  ).show();

                  break;

                case 'What Is MBTI?':
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const MBTIInfo(),));
                  break;

                case '16 Personalities':
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const Types(),));
                  break;

                case 'Sources':
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Sources(),));
                  break;

                case 'Who Am I?':
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const Me(),));
                  break;
              }

          },
          child: Text(
            name,
            style: const TextStyle(fontSize: 15, color: Colors.white),

          ),
          //color: Colors.white12,
          //height: 50,
          //shape: RoundedRectangleBorder(
          //  borderRadius: BorderRadius.circular(30)),

        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 28, 89, 125),
        body: SafeArea(
          child: Column(
            children: [
              
              Container(height: 300, child: Image.asset('images/bg.png'),),



              Expanded(
                child: Container(
                  padding: const EdgeInsets.only( top: 90),
                  decoration: const  BoxDecoration(
                    color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(50.0),
                        topLeft: Radius.circular(50.0),
                      )
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(left:70.0, right: 70.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          menuButtonCreator('Test'),
                          const SizedBox(height: 15,),
                          menuButtonCreator('What Is MBTI?'),
                          const SizedBox(height: 15,),
                          menuButtonCreator('16 Personalities'),
                          const SizedBox(height: 15,),
                          menuButtonCreator('Sources'),
                          const SizedBox(height: 15,),
                          menuButtonCreator('Who Am I?')
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),

        ),
      ),
    );
  }
}