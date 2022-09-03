
import 'package:flutter/material.dart';

class MBTIInfo extends StatelessWidget {
  const MBTIInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            onTap: (){
              Navigator.of(context).pop();
            },
            child: const Icon(Icons.arrow_back, ),
          ),
          backgroundColor: const Color.fromARGB(255, 28, 89, 125),
          toolbarHeight: 80,
          title: const Text('What Is MBTI?'),
        ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Image.asset('infoText/1.png'),
                    Padding(padding: const EdgeInsets.all(10.0), child: Image.asset('infoText/2.png'),),
                    Image.asset('infoText/3.png'),
                    Image.asset('infoText/4.png'),
                    Image.asset('infoText/5.png'),
                  ],
                ),
              ),
            ),
          ),
      ),
    );
  }
}
