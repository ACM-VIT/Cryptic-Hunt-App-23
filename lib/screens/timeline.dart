import 'package:flutter/material.dart';
import '../widgets/card.dart';

class Timeline extends StatefulWidget {
  static String id = "Timeline";
  const Timeline({Key? key}) : super(key: key);

  @override
  State<Timeline> createState() => _Timeline();
}

class _Timeline extends State<Timeline> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(
            color: Colors.black
        ),
        backgroundColor: const Color(0xffFFF4EA) ,
        title: const Text("Timeline",style: TextStyle(
          fontSize: 18,
          fontFamily: "Poppins",
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),),

      ),
      backgroundColor: const Color(0xffFFF4EA),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: const [
          CustomCard(
            day: "THU",
            date: "25th",
            heading: "Speaker Session 1",
            desc: "Works ig",
            time: "8am-10pm",
          ),
          CustomCard(
            day: "THU",
            date: "25th",
            heading: "Speaker Session 2",
            desc: "idts ... it doesnt work so far",
            time: "8am-10pm",
          ),
          CustomCard(
            day: "THU",
            date: "25th",
            heading: "Speaker Session 3",
            desc: "nahi dalte hai",
            time: "8am-10pm",
          ),
          CustomCard(
            day: "THU",
            date: "25th",
            heading: "Speaker Session 4",
            desc: "Okay ab chal raha hai",
            time: "8am-10pm",
          ),
        ],
      ),
    );
  }
}
