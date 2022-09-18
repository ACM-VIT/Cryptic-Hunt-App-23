import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Hamburger extends StatelessWidget {
  static String id = "Hamburger";
  const Hamburger({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HamburgerPage(),
    );
  }
}

class HamburgerPage extends StatelessWidget {
  const HamburgerPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Crytic Hunt"),
        backgroundColor: const Color(0xffff7a01),
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(4.0, 0, 4.0, 0),
              child: DrawerHeader(
                decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(color: Color(0xFFFF7A01), width: 1)),
                ),
                child: Row(
                  children: [
                    SvgPicture.asset('assets/HamBurger/profilepic.svg'),
                    const SizedBox(
                      width: 15,
                      height: 0,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'JEET KAUSHIK',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                              fontSize: 18),
                        ),
                        SizedBox(
                          height: 17,
                          width: 1,
                        ),
                        Text(
                          "50 PTS",
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color: Color(0xFF777777)),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset('assets/HamBurger/timeline.svg'),
                  const Padding(padding: EdgeInsets.fromLTRB(13.59, 0, 0, 0)),
                  const Text(
                    "Timeline",
                    style: TextStyle(
                        color: Color(0xffFF8618),
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        fontSize: 14),
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset('assets/HamBurger/archive.svg'),
                  const Padding(padding: EdgeInsets.fromLTRB(13.59, 0, 0, 0)),
                  const Text(
                    "Archive",
                    style: TextStyle(
                        color: Color(0xffFF8618),
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        fontSize: 14),
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset('assets/HamBurger/resources.svg'),
                  const Padding(padding: EdgeInsets.fromLTRB(13.59, 0, 0, 0)),
                  const Text(
                    "Resources",
                    style: TextStyle(
                        color: Color(0xffFF8618),
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        fontSize: 14),
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset('assets/HamBurger/faq.svg'),
                  const Padding(padding: EdgeInsets.fromLTRB(13.59, 0, 0, 0)),
                  const Text(
                    "Frequently Asked Questions",
                    style: TextStyle(
                        color: Color(0xffFF8618),
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        fontSize: 14),
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset('assets/HamBurger/sponsors.svg'),
                  const Padding(padding: EdgeInsets.fromLTRB(13.59, 0, 0, 0)),
                  const Text(
                    "Our Sponsors",
                    style: TextStyle(
                        color: Color(0xffFF8618),
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        fontSize: 14),
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset('assets/HamBurger/profile.svg'),
                  const Padding(padding: EdgeInsets.fromLTRB(13.59, 0, 0, 0)),
                  const Text(
                    "Profile",
                    style: TextStyle(
                        color: Color(0xffFF8618),
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        fontSize: 14),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        child: const Text("Hamburger"),
      ),
    );
  }

  void writeInSharedPreference() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool("Logged_In", true);
  }
}
