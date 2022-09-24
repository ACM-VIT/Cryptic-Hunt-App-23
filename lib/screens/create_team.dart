import 'package:cryptic_hunt/Providers/team_notifier.dart';
import 'package:cryptic_hunt/data/team.dart';
import 'package:cryptic_hunt/screens/navigation_manager.dart';
import 'package:cryptic_hunt/widgets/generate_code_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CreateTeamPage extends StatelessWidget {
  static String id = "CreateTeam";
  const CreateTeamPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 20),
      color: const Color(0xFFFFF4EA),
      child: ListView(
        children: [
          const GenerateCodeForm(),
          if (Provider.of<TeamNotifier>(context).codeGenerated)
            const TeamCodeForm(),
        ],
      ),
    );
  }
}

class TeamCodeForm extends StatelessWidget {
  const TeamCodeForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
          width: MediaQuery.of(context).size.width * 0.3,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.white),
          padding: const EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                Provider.of<TeamNotifier>(context).team?.teamcode ?? '',
                style: TextStyle(letterSpacing: 2),
              ),
              const SizedBox(
                width: 5,
              ),
              GestureDetector(
                child: Icon(
                  Icons.copy,
                  color: Theme.of(context).primaryColor,
                ),
                onTap: () {
                  Clipboard.setData(ClipboardData(
                      text: Provider.of<TeamNotifier>(context, listen: false)
                              .team
                              ?.teamcode ??
                          ''));
                },
              )
            ],
          ),
        ),
        const SizedBox(height: 45),
        ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, NavigationManager.id);
          },
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
                  "Next",
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
    );
  }
}
