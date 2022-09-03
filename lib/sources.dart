import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Sources extends StatelessWidget {
  const Sources({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment:  CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: TextButton(onPressed: () async {
                  const url = "https://www.wikipedia.org/";
                  if (await canLaunchUrl(Uri.parse(url))) {
                    await launchUrl(Uri.parse(url));
                  } else {
                    throw "Could not launch $url";
                  }
                }, child: const Text('MBTI Information', style: TextStyle(fontSize: 20),)),
              ),


              Expanded(
                child: TextButton (onPressed: () async {

                  const url = "https://www.pinterest.com/";
                  if (await canLaunchUrl(Uri.parse(url))) {
                    await launchUrl(Uri.parse(url));
                  } else {
                    throw "Could not launch $url";
                  }

                }, child: const Text('Pictures of types', style: TextStyle(fontSize: 20),)),
              ),


              Expanded(
                child: TextButton (onPressed: () async {

                  const url = "https://www.simplypsychology.org/the-myers-briggs-type-indicator.html";
                  if (await canLaunchUrl(Uri.parse(url))) {
                    await launchUrl(Uri.parse(url));
                  } else {
                    throw "Could not launch $url";
                  }

                }, child: const Text('Descriptions of types', style: TextStyle(fontSize: 20),)),
              ),


              Expanded(
                child: TextButton (onPressed: () async {

                  const url = "https://www.16personalities.com/";
                  if (await canLaunchUrl(Uri.parse(url))) {
                    await launchUrl(Uri.parse(url));
                  } else {
                    throw "Could not launch $url";
                  }


                }, child: const Text('Questions of test', style: TextStyle(fontSize: 20),)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
