import 'package:cryptic_hunt/widgets/appbar.dart';
import 'package:cryptic_hunt/widgets/signup/textWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfilePage extends StatelessWidget {
  static String id = "ProfilePage";
  final List<String> teamMemberName = [
    "TeamMember1",
    "TeamMember2",
    "TeamMember3"
  ];
  final String fontFamily = "Poppins";
  ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        toolbarHeight: 0,
      ),
      //backgroundColor: const Color(0xffFF7A01),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              SizedBox(
                width: double.infinity,
                child: SvgPicture.asset(
                  fit: BoxFit.cover,
                  'assets/profilepagebg.svg',
                ),
              ),
              const CustomAppBar(),
            ],
          ),
          const SizedBox(
            height: 16,
            width: double.infinity,
          ),
          const Text(
            "Team Name",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontFamily: "Poppins",
              fontSize: 20,
              color: Color(0xff181818),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 0, 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CustomTextWidget("Siddhant C", fontFamily,
                              FontWeight.w700, 24, const Color(0xff181818)),
                          const Expanded(flex: 1, child: SizedBox()),
                          TextButton(
                              onPressed: () {},
                              child: CustomTextWidget("Logout", fontFamily,
                                  FontWeight.w500, 14, const Color(0xff828282)))
                        ],
                      ),
                      CustomTextWidget("siddhantc@gmail.com", fontFamily,
                          FontWeight.w400, 16, const Color(0xFFFF7A01)),
                      const SizedBox(
                        height: 24,
                      ),
                      CustomTextWidget("Members", fontFamily, FontWeight.w500,
                          20, const Color(0xff000000)),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          CustomTextWidget("Team Leader", fontFamily,
                              FontWeight.w400, 16, const Color(0xff181818)),
                          const SizedBox(
                            width: 10,
                          ),
                          SvgPicture.asset("assets/profilepageleadericon.svg")
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: teamMemberName.length,
                        itemBuilder: (context, index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomTextWidget(
                                  teamMemberName[index],
                                  fontFamily,
                                  FontWeight.w400,
                                  16,
                                  const Color(0xff181818)),
                              const SizedBox(
                                height: 20,
                              )
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
