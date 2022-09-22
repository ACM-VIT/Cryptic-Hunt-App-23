import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:clipboard/clipboard.dart';

class CreateTeamFirst extends StatefulWidget {
  static String id = "CreateTeamFirst";
  final TextEditingController controllerText = TextEditingController();
  final TextEditingController controllerNumber = TextEditingController();
  CreateTeamFirst({Key? key}) : super(key: key);

  @override
  State<CreateTeamFirst> createState() => _CreateTeamFirst();
}

class _CreateTeamFirst extends State<CreateTeamFirst> {
  bool pressed = false;
  bool maxMemberError = false;
  bool emptyTeamFieldError = false;
  bool emptyMemberFieldError = false;
  late String code;
  final Color activeButton = const Color(0xffFF7A01);
  Color currentButton = Colors.orangeAccent; //passive button

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // appBar: AppBar(
      //   toolbarHeight: 0,
      // ),
      backgroundColor: const Color(0xffFFF4EA),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Flexible(
            // color: Colors.pink,
            child: ListView(
              shrinkWrap: false,
              children: [
                Container(
                  // color: Colors.green,
                  padding: const EdgeInsets.all(10.0),
                  child: Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      // color: Colors.blue,
                      child: SvgPicture.asset(
                        'assets/createTeam/Heading.svg',
                        height: 50,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.all(10),
                  // color: Colors.blue,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Team Name",
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      TextField(
                        controller: widget.controllerText,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Color(0xffff7a01), width: 2),
                            borderRadius: BorderRadius.all(Radius.circular(7)),
                          ),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(7))),
                          hintText: "Enter your Team Name",
                        ),
                        //enabled: !pressed,
                      ),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.all(10),
                  // color: Colors.grey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Number of Members",
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      TextField(
                        controller: widget.controllerNumber,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Color(0xffff7a01), width: 2),
                            borderRadius: BorderRadius.all(Radius.circular(7)),
                          ),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(7))),
                          hintText: "Max : 6",
                        ),
                        //enabled: !pressed,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextButton(
                      style: ElevatedButton.styleFrom(
                        primary: activeButton,
                        elevation: 2,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 20),
                      ),
                      onPressed: () {
                        setState(
                          () {
                            /*
                            the button works only once i.e. only 1 code can be generated
                            also both text fields cannot be edited once code is generated
                            */
                            if (!pressed) {
                              // Team Name field checking
                              if (widget.controllerText.text.isEmpty) {
                                emptyTeamFieldError = true;
                              } else {
                                emptyTeamFieldError = false;
                              }

                              // Team Member Number field checking
                              if (widget.controllerNumber.text.isEmpty) {
                                emptyMemberFieldError = true;
                              } else if (int.parse(
                                      widget.controllerNumber.text) >
                                  6) {
                                maxMemberError = true;
                                emptyMemberFieldError = false;
                              } else {
                                maxMemberError = false;
                                emptyMemberFieldError = false;
                              }
                              if (emptyTeamFieldError == false &&
                                  emptyMemberFieldError == false &&
                                  maxMemberError == false) {
                                pressed = true;
                                currentButton = activeButton;
                                code = "abc"; //TO DO
                              }
                            }
                          },
                        );
                      },
                      child: const Text(
                        "Generate Code",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      )),
                ),
                emptyTeamFieldError
                    ? Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.all(10),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "~ERROR~",
                                style: TextStyle(
                                    color: Colors.orange, fontSize: 24),
                              ),
                              Text(
                                "Team Name can't be empty",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ]))
                    : Container(),
                emptyMemberFieldError
                    ? Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.all(10),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "~ERROR~",
                                style: TextStyle(
                                    color: Colors.orange, fontSize: 24),
                              ),
                              Text(
                                "Please Fill Member Number",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ]))
                    : Container(),
                maxMemberError
                    ? Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.all(10),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "***ERROR***",
                                style: TextStyle(
                                    color: Colors.orange, fontSize: 24),
                              ),
                              Text(
                                "MAXIMUM MEMBER IN A TEAM : 6",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ]))
                    : Container(),
                pressed
                    ? Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                "Team Code",
                                style: TextStyle(
                                    color: Colors.orange, fontSize: 24),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                "Share it only with your teammates, "
                                "you can find it anytime in team profile section also.",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                ),
                                padding: const EdgeInsets.all(5),
                                child: Directionality(
                                  textDirection: TextDirection.rtl,
                                  child: TextButton.icon(
                                    icon: const Icon(
                                      Icons.copy,
                                      color: Colors.orange,
                                    ),
                                    label: const Text(
                                      " < C O P Y >",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: "Poppins",
                                        color: Colors.black,
                                      ),
                                    ),
                                    onPressed: () {
                                      FlutterClipboard.copy(code);
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    : Container(),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextButton(
                style: ElevatedButton.styleFrom(
                  primary: currentButton,
                  elevation: 2,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                ),
                onPressed: () {
                  setState(
                    () {
                      if (pressed) currentButton = Colors.red;
                    },
                  );
                },
                child: const Text(
                  "Create Team",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                )),
          ),
        ],
      ),
    );
  }
}
