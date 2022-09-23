import 'package:cryptic_hunt/widgets/generate_code_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateTeam extends StatelessWidget {
  static String id = "CreateTeam";
  const CreateTeam({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CreateTeamPage(),
    );
  }
}

class CreateTeamPage extends StatelessWidget {
  const CreateTeamPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 20),
          color: const Color(0xFFFFF4EA),
          child: ListView(
            children: [
              const GenerateCodeForm(),
              Text("Team Code",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: const Color(0xFFFF7A01))),
              const SizedBox(
                height: 6,
              ),
              Text(
                  "Share it only with your teammates, you can find it anytime in team profile section also.",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: const Color(0xFF181818))),
              const SizedBox(
                height: 20,
              ),
              Container(
               width: MediaQuery.of(context).size.width / 2,
                color: const Color(0xFFFFFFFF),
                padding: const EdgeInsets.all(8),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("text"),
                    const SizedBox(
                      width: 16,
                    ),
                    GestureDetector(
                      child: const Icon(
                        Icons.copy,
                      ),
                      onTap: () {
                        Clipboard.setData(const ClipboardData(text: "text"));
                      },
                    )
                  ],
                ),
              ),
              
              const SizedBox(
                height: 155,
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xFFFF7A01),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 11),
                      child: Text(
                        "Create Team",
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFFFFFFFF),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
