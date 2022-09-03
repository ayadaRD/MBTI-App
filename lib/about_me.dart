import 'package:flutter/material.dart';

class Me extends StatelessWidget {
  const Me({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color.fromARGB(240, 255, 207, 164),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(30, 255, 207, 164),
          shadowColor: const Color.fromARGB(0, 255, 207, 164),
          leading: GestureDetector(
            onTap: (){
              Navigator.of(context).pop();
            },
            child: const Icon(Icons.arrow_back, color: Colors.white,),

          ),
        ),
        body: SafeArea(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                //profile image
                Center(child: CircleAvatar (backgroundImage: AssetImage('images/me.jpg'), radius: 135,),),
                SizedBox(height: 20,),
                Text('Ayda Asghari',style: TextStyle(fontFamily: 'MyFont', fontSize: 50, color: Colors.white),),
                SizedBox(height: 30,),
                Text('(future) Flutter Developer', style: TextStyle( fontSize: 20, color: Colors.white)),

                SizedBox(height: 20.0, child: Divider(color: Colors.white, thickness: 2, endIndent: 60, indent: 60,)),

                Card(
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 40.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.confirmation_num,
                      color: Colors.grey,
                    ),
                    title: Text(
                      ' github.com/ayadaRD',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15.0,
                        color: Colors.grey
                      ),
                    ),
                  ),
                ),
                Card(
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 40.0),
                  child: ListTile(
                    leading: Icon(Icons.email, color: Colors.grey),
                    title: Text(
                      'indigor761@gmail.com',
                      style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                    ),
                  ),
                ),

                Card(
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 40.0),
                  child: ListTile(
                    leading: Icon(Icons.telegram, color: Colors.grey, size: 30,),
                    title: Text(
                      'Ayda_as94',
                      style: TextStyle(
                          //fontWeight: FontWeight.bold,
                          fontSize: 15.0,
                          color: Colors.grey),
                    ),
                  ),
                ),
                SizedBox(height: 50),
              ],

            ),
          ),
        ),
      ),
    );
  }
}
