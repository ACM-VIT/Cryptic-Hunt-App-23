import 'package:cryptic_hunt/widgets/signup/textWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../widgets/textField.dart';

class QuestionPage extends StatelessWidget {
  static String id = 'Question';
  QuestionPage({Key? key}) : super(key: key);
  final back = SvgPicture.asset('assets/question/back.svg');
  final qrIcon = SvgPicture.asset('assets/question/qr_scan.svg');
  Color bgColor = const Color(0xfffff4ea);
  final String fontFamily = "Poppins";
  final TextEditingController controller = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: bgColor,
      body: PageView.builder(
        itemBuilder: (context, index){
          return

            Column(
            children: [
              Expanded(child: ListView(
                children: [ Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(padding:const EdgeInsets.fromLTRB(16, 50, 0, 0),
                          child: back),
                      Padding(padding: const EdgeInsets.fromLTRB(8, 40, 0, 0),
                          child: TextWidget("Question Prompt", fontFamily, FontWeight.w600,
                              24, const Color(0xff000000)))
                    ]),
                  const Padding(padding: EdgeInsets.fromLTRB(16, 4, 16, 16),
                      child:Divider(
                        color: Colors.black,
                        height: 8.0,
                        thickness: 1.0,
                      )),
                  Padding(padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                      child: TextWidget("Question Title", fontFamily, FontWeight.w600,
                          20, const Color(0xff000000))),
                  Padding(padding: const EdgeInsets.fromLTRB(16, 4, 16, 16),
                      child: TextWidget("Easy", fontFamily, FontWeight.w600,
                          16, const Color(0xff8A8A8A))),
                  Padding(padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                      child: TextWidget("Lorem Ipsum is simply dummy text of "
                          "the printing and typesetting industry. "
                          "Lorem Ipsum has been the industry's "
                          "standard dummy text ever since the 1500s, "
                          "when an unknown printer took a galley of type "
                          "and scrambled it to make a type specimen book. ", fontFamily, FontWeight.w600,
                          18, const Color(0xff181818))),

                ],
              )),


              Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                child: Text(
                    "Enter Text",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: const Color(0xff181818),
                        fontFamily: fontFamily,
                        fontWeight: FontWeight.w600,
                        fontSize: 14)
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 4, 16, 8),
                child: Textfeild("Type your answer here", controller,
                    TextInputType.text),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Padding(padding: EdgeInsets.fromLTRB(0,0,0,0),
                      child:Divider(
                        color: Color(0xff8A8A8A),
                        height: 8.0,
                        thickness: 1.0,
                      )),
                  Text(
                      "or",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: const Color(0xff8A8A8A),
                          fontFamily: fontFamily,
                          fontWeight: FontWeight.w600,
                          fontSize: 14)
                  ),
                  const Padding(padding: EdgeInsets.fromLTRB(0,0,0,0),
                      child:Divider(
                        color: Color(0xff8A8A8A),
                        height: 8.0,
                        thickness: 1.0,
                      ))
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      primary: const Color(0xffFF7A01),
                      minimumSize: const Size.fromHeight(40)),
                  child: Center(
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children:[
                            Padding(padding:const EdgeInsets.fromLTRB(4, 16, 0, 16),
                                child: qrIcon),
                            Text(
                              "Scan QR Code",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: fontFamily,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14),
                            )
                          ])),),
              ),
              const SizedBox(
                height: 20,
              )

            ]);
        }
      )
    );
  }
}