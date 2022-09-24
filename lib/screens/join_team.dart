import 'package:cryptic_hunt/Providers/team_notifier.dart';
import 'package:cryptic_hunt/screens/navigation_manager.dart';
import 'package:cryptic_hunt/widgets/custom_button.dart';
import 'package:cryptic_hunt/widgets/signup/textWidget.dart';
import 'package:cryptic_hunt/widgets/alerts/wrong_teamcode_alertdialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class JoinTeamScreen extends StatelessWidget {
  static String id = "JoinTeam";
  final fontFamily = "Poppins";
  final teamCodeController = TextEditingController();
  final bool validCode = false;
  JoinTeamScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: double.maxFinite,
          width: double.maxFinite,
          child: SvgPicture.asset(
            "assets/join_team_bg.svg",
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Expanded(child: SizedBox()),
            Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                child: CustomTextWidget("Enter Team Code", fontFamily,
                    FontWeight.w600, 24, const Color(0xff181818))),
            Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                child: CustomTextWidget(
                    "description about what is team code, and from where the user can get it.",
                    fontFamily,
                    FontWeight.w600,
                    24,
                    const Color(0xffFDFDFD))),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 30, 16, 8),
              child: TextField(
                style: const TextStyle(
                    letterSpacing: 4.0, color: Color(0xFFFF7A01)),
                textAlign: TextAlign.center,
                controller: teamCodeController,
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xffff7a01), width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(7)),
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(7))),
                  hintText: "Enter Team Code",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 30, 16, 60),
              child: Provider.of<TeamNotifier>(context, listen: false).busy
                  ? const Center(child: CircularProgressIndicator())
                  : ElevatedButton(
                      onPressed: () async {
                        if (teamCodeController.text.isNotEmpty) {
                          final navigator = Navigator.of(context);
                          print(teamCodeController.text);
                          bool result = await Provider.of<TeamNotifier>(context,
                                  listen: false)
                              .joinTeam(teamCodeController.text);

                          if (result) {
                            // user successfully joined a team
                            navigator.pushNamed(NavigationManager.id);
                          } else {
                            // join team failed
                            // TODO: Show alert dialog saying that join team failed
                          }
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(20),
                          primary: const Color(0xffFF7A01),
                          minimumSize: const Size.fromHeight(40)),
                      child: const Text("JOIN TEAM",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w600,
                          ))),
            ),
          ],
        )
      ],
    );
  }
}
