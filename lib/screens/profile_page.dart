import 'package:cryptic_hunt/Providers/profile_notifier.dart';
import 'package:cryptic_hunt/widgets/custom_app_bar.dart';
import 'package:cryptic_hunt/widgets/signup/textWidget.dart';
import 'package:flutter/material.dart';
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
    return SafeArea(
        child: Scaffold(
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
              CustomAppBarWidget(title: "Profile"),
            ],
          ),
          const SizedBox(
            height: 16,
            width: double.infinity,
          ),
          Text(
            widget.state.team?.name ?? "Error",
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
                          CustomTextWidget(
                              widget.state.user?.name ?? " ",
                              fontFamily,
                              FontWeight.w700,
                              24,
                              const Color(0xff181818)),
                          const Expanded(flex: 1, child: SizedBox()),
                          TextButton(
                              onPressed: () {},
                              child: CustomTextWidget("Logout", fontFamily,
                                  FontWeight.w500, 14, const Color(0xff828282)))
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
                        itemCount: widget.state.team?.members?.length ?? 0,
                        itemBuilder: (context, index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomTextWidget(
                                  widget.state.team?.members?[index].name ??
                                      " ",
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
    ));
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
