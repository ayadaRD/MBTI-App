import 'package:flutter/material.dart';
import 'package:vertical_tabs/vertical_tabs.dart';


class Types extends StatelessWidget {
  const Types({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: GestureDetector(
            onTap: (){
              Navigator.of(context).pop();
            },
            child: const Icon(Icons.arrow_back, color: Colors.blueGrey, ),
          ),
          shadowColor: const Color.fromARGB(0, 0, 0, 0),
          backgroundColor: Colors.white,
          title: const Center(child: Text('Personalities', style: TextStyle(color: Colors.blueGrey), )),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 70.0, left: 15, right: 5, bottom: 5),
              child: Column(
                children: <Widget>[


                  Container(
                    height: 500,
                    child: VerticalTabs(
                      indicatorColor: Colors.teal,
                      backgroundColor: const Color.fromARGB(100, 19, 252, 226),
                      tabsShadowColor: const Color.fromARGB(0, 0, 0, 0),
                      selectedTabBackgroundColor: const Color.fromARGB(100, 19, 252, 226),
                      tabBackgroundColor: Colors.white,
                      tabsWidth: 100,
                      direction: TextDirection.ltr,
                      contentScrollAxis: Axis.horizontal,
                      changePageDuration: const Duration(milliseconds: 500),
                      tabs: const <Tab>[
                        Tab(child:  Center(child: Text('ISTJ', style: TextStyle(color: Color.fromARGB(255, 10, 105, 94)),), heightFactor: 6),),
                        Tab(child: Center(child: Text('ESTJ', style: TextStyle(color: Color.fromARGB(255, 10, 105, 94)),), heightFactor: 6),),
                        Tab(child: Center(child: Text('ISFJ', style: TextStyle(color: Color.fromARGB(255, 10, 105, 94)),), heightFactor: 6),),
                        Tab(child: Center(child: Text('ESFJ', style: TextStyle(color: Color.fromARGB(255, 10, 105, 94)),), heightFactor: 6)),
                      ],
                      contents: <Widget>[
                        tabsContent('ISTJ', 'desc', 'images/ISTJ.png', Colors.teal),
                        tabsContent('ESTJ', 'desc', 'images/ESTJ.png', Colors.teal),
                        tabsContent('ISFJ', 'desc', 'images/ISFJ.png', Colors.teal),
                        tabsContent('ESFJ', 'desc', 'images/ESFJ.png', Colors.teal),
                      ],
                    ),
                  ),



                  const SizedBox(height: 90,),

                  Container(


                    height: 500,
                    child: VerticalTabs(
                      indicatorColor: Colors.amber,
                      tabsWidth: 100,
                      direction: TextDirection.ltr,
                      tabBackgroundColor: Colors.white,
                      contentScrollAxis: Axis.horizontal,
                      tabsShadowColor: const Color.fromARGB(0, 0, 0, 0),

                      backgroundColor: const Color.fromARGB(100, 241, 244, 112),
                      selectedTabBackgroundColor: const Color.fromARGB(100, 241, 244, 112),


                      changePageDuration: const Duration(milliseconds: 500),
                      tabs: const <Tab>[
                        Tab(child: Center(child: Text('ISTP', style: TextStyle(color: Color.fromARGB(255, 86, 80, 0)),), heightFactor: 6),),
                        Tab(child: Center(child: Text('ESTP', style: TextStyle(color: Color.fromARGB(255, 86, 80, 0)),), heightFactor: 6)),
                        Tab(child: Center(child: Text('ISFP', style: TextStyle(color: Color.fromARGB(255, 86, 80, 0)),), heightFactor: 6)),
                        Tab(child: Center(child: Text('ESFP', style: TextStyle(color: Color.fromARGB(255, 86, 80, 0)),), heightFactor: 6)),
                      ],
                      contents: <Widget>[
                        tabsContent('ISTP', 'desc', 'images/ISTP.png', Colors.amber),
                        tabsContent('ESTP', 'desc', 'images/ESTP.png', Colors.amber),
                        tabsContent('ISFP', 'desc', 'images/ISFP.png', Colors.amber),
                        tabsContent('ESFP', 'desc', 'images/ESFP.png', Colors.amber),
                      ],
                    ),
                  ),


                  const SizedBox(height: 90,),

                  Container(


                    height: 500,
                    child: VerticalTabs(
                      indicatorColor: Colors.green,
                      tabsWidth: 100,
                      direction: TextDirection.ltr,
                      tabBackgroundColor: Colors.white,
                      contentScrollAxis: Axis.horizontal,
                      tabsShadowColor: const Color.fromARGB(0, 0, 0, 0),

                      backgroundColor: const Color.fromARGB(100, 127, 244, 112),
                      selectedTabBackgroundColor: const Color.fromARGB(100, 127, 244, 112),


                      changePageDuration: const Duration(milliseconds: 500),
                      tabs: const <Tab>[
                        Tab(child: Center(child: Text('INFJ', style: TextStyle(color: Color.fromARGB(255, 22, 106, 3)),), heightFactor: 6),),
                        Tab(child: Center(child: Text('ENFJ', style: TextStyle(color: Color.fromARGB(255, 22, 106, 3)),), heightFactor: 6)),
                        Tab(child: Center(child: Text('INFP', style: TextStyle(color: Color.fromARGB(255, 22, 106, 3)),), heightFactor: 6)),
                        Tab(child: Center(child: Text('ENFP', style: TextStyle(color: Color.fromARGB(255, 22, 106, 3)),), heightFactor: 6)),
                      ],
                      contents: <Widget>[
                        tabsContent('INFJ', 'desc', 'images/INFJ.png', Colors.green),
                        tabsContent('ENFJ', 'desc', 'images/ENFJ.png', Colors.green),
                        tabsContent('INFP', 'desc', 'images/INFP.png', Colors.green),
                        tabsContent('ENFP', 'desc', 'images/ENFP.png', Colors.green),
                      ],
                    ),
                  ),





                  const SizedBox(height: 90,),


                  Container(


                    height: 500,
                    child: VerticalTabs(
                      indicatorColor: Colors.deepPurple,
                      tabsWidth: 100,
                      direction: TextDirection.ltr,
                      tabBackgroundColor: Colors.white,
                      contentScrollAxis: Axis.horizontal,
                      tabsShadowColor: const Color.fromARGB(0, 0, 0, 0),

                      backgroundColor: const Color.fromARGB(100, 187, 112, 244),
                      selectedTabBackgroundColor: const Color.fromARGB(100, 187, 112, 244),


                      changePageDuration: const Duration(milliseconds: 500),
                      tabs: const <Tab>[
                        Tab(child: Center(child: Text('ENTJ', style: TextStyle(color: Color.fromARGB(255, 43, 0, 86)),), heightFactor: 6),),
                        Tab(child: Center(child: Text('INTJ', style: TextStyle(color: Color.fromARGB(255, 43, 0, 86)),), heightFactor: 6)),
                        Tab(child: Center(child: Text('ENTP', style: TextStyle(color: Color.fromARGB(255, 43, 0, 86)),), heightFactor: 6)),
                        Tab(child: Center(child: Text('INTP', style: TextStyle(color: Color.fromARGB(255, 43, 0, 86)),), heightFactor: 6)),
                      ],
                      contents: <Widget>[
                        tabsContent('ENTJ', 'desc', 'images/ENTJ.png', Colors.deepPurple),
                        tabsContent('INTJ', 'desc', 'images/INTJ.png', Colors.deepPurple),
                        tabsContent('ENTP', 'desc', 'images/ENTP.png', Colors.deepPurple),
                        tabsContent('INTP', 'desc', 'images/INTP.png', Colors.deepPurple),
                      ],
                    ),
                  ),

                  const SizedBox(height: 90,),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget tabsContent(String caption, var description , String ImagePath, Color color ) {

    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(20),
      color: color,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Image.asset(ImagePath, height: 200, width: 200),
            const SizedBox(height: 10,),
            Text(caption, style: const TextStyle(fontSize: 25, color: Colors.white,),),
            const Divider(height: 20, color: Colors.white,),
            Image.asset('Descriptions/$caption/1.png'),
            Image.asset('Descriptions/$caption/2.png'),
            Image.asset('Descriptions/$caption/3.png'),
            Image.asset('Descriptions/$caption/4.png'),
            Image.asset('Descriptions/$caption/5.png'),
          ],
        ),
      ),
    );
  }
}