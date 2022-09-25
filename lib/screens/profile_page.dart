import 'package:cryptic_hunt/Providers/profile_notifier.dart';
import 'package:cryptic_hunt/widgets/custom_app_bar.dart';
import 'package:cryptic_hunt/widgets/signup/textWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:cryptic_hunt/data/user.dart';

class ProfilePage extends StatefulWidget {
  static String id = 'ProfilePage';

  ProfilePage({super.key, required this.state});

  ProfileNotifier state;

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  List<User?> items = [];
  final String fontFamily = "Poppins";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
          statusBarColor: Theme.of(context).primaryColor,
        ),
      ),
      //backgroundColor: const Color(0xffFF7A01),
      body: SafeArea(
        child: Column(
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
                CustomAppBarWidget(title: "Profile"),
              ],
            ),
            const SizedBox(
              height: 24,
              width: double.infinity,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text(
                      "RANK",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontFamily: "Poppins",
                        fontSize: 16,
                        color: Color(0xff181818),
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      widget.state.team?.rank.toString() ?? "",
                      style: TextStyle(letterSpacing: 2),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      widget.state.team?.name.toUpperCase() ?? "Error",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontFamily: "Poppins",
                        fontSize: 20,
                        color: Color(0xff181818),
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          widget.state.team?.teamcode ?? "",
                          style: TextStyle(letterSpacing: 2),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          child: Icon(
                            Icons.copy,
                            color: Theme.of(context).primaryColor,
                          ),
                          onTap: () {
                            Clipboard.setData(ClipboardData(
                                text: widget.state.team?.teamcode ?? ''));
                          },
                        )
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "POINTS",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontFamily: "Poppins",
                        fontSize: 16,
                        color: Color(0xff181818),
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      widget.state.team?.points.toString() ?? "",
                      style: TextStyle(letterSpacing: 2),
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
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
                            CustomTextWidget(
                                widget.state.user?.name ?? " ",
                                fontFamily,
                                FontWeight.w700,
                                24,
                                const Color(0xff181818)),
                            const Expanded(flex: 1, child: SizedBox()),
                            TextButton(
                                onPressed: () {
                                  widget.state.logOut().then(
                                      (value) => Navigator.of(context).pop());
                                },
                                child: CustomTextWidget(
                                    "Logout",
                                    fontFamily,
                                    FontWeight.w500,
                                    14,
                                    const Color(0xff828282)))
                          ],
                        ),
                        CustomTextWidget(
                            widget.state.user?.email ?? " ",
                            fontFamily,
                            FontWeight.w400,
                            16,
                            const Color(0xFFFF7A01)),
                        const SizedBox(
                          height: 24,
                        ),
                        CustomTextWidget("Members", fontFamily, FontWeight.w500,
                            20, const Color(0xff000000)),
                        const SizedBox(
                          height: 10,
                        ),
                        // Row(
                        //   children: [
                        //     CustomTextWidget("Team Leader", fontFamily,
                        //         FontWeight.w400, 16, const Color(0xff181818)),
                        //     const SizedBox(
                        //       width: 10,
                        //     ),
                        //     SvgPicture.asset("assets/profilepageleadericon.svg")
                        //   ],
                        // ),
                        // const SizedBox(
                        //   height: 20,
                        // ),
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: widget.state.team?.members?.length ?? 0,
                          itemBuilder: (context, index) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    CustomTextWidget(
                                        widget.state.team?.members?[index]
                                                .name ??
                                            " ",
                                        fontFamily,
                                        FontWeight.w400,
                                        16,
                                        const Color(0xff181818)),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    if (widget.state.team?.members?[index].id ==
                                        widget.state.team?.teamLeaderId)
                                      SvgPicture.asset(
                                          "assets/profilepageleadericon.svg")
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
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
      ),
    );
  }

  @override
  void initState() {
    getProfile();
    super.initState();
  }

  Future<void> getProfile() async {
    await widget.state.getUser();
    await widget.state.getTeam();
    items = widget.state.team?.members ?? [];
  }
}
