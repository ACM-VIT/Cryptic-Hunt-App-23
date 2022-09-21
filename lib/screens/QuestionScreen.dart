import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class Question extends StatelessWidget {
static String id = "Question";
const Question({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: QuestionScreen(),
    );
  }
}


class QuestionScreen extends StatelessWidget {
  QuestionScreen({Key? key}) : super(key: key);
  final Widget back = SvgPicture.asset('assets/Question/back.svg');
  Color bgColor = const Color(0xfffff4ea);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: PageView.builder(
        itemBuilder: (context, index){
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "Question Prompt",
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w300,
                  fontSize: 40
                ),
              )
            ],
          );
        }
      )

    );
  }
}