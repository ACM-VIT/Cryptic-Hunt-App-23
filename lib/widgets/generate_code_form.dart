import 'package:cryptic_hunt/Providers/team_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class GenerateCodeForm extends StatefulWidget {
  const GenerateCodeForm({Key? key}) : super(key: key);

  @override
  State<GenerateCodeForm> createState() => _GenerateCodeFormState();
}

class _GenerateCodeFormState extends State<GenerateCodeForm> {
  String? teamname;
  final teamNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 28,
        ),
        SvgPicture.asset("assets/CreateTeam/logo.svg"),
        const SizedBox(
          height: 39,
        ),
        Text("Team Name",
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: const Color(0xFF181818))),
        const SizedBox(
          height: 8,
        ),
        TextField(
          onChanged: (val) {
            teamname = val;
          },
          controller: teamNameController,
          decoration: const InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFFF7A01), width: 1.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF181818), width: 1.0),
            ),
            hintText: "Enter your Team Name",
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Text("Number of Members",
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: const Color(0xFF181818))),
        const SizedBox(
          height: 8,
        ),
        TextField(
          decoration: const InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFFF7A01), width: 1.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF181818), width: 1.0),
            ),
            hintText: "4",
          ),
        ),
        const SizedBox(
          height: 32,
        ),
        (Provider.of<TeamNotifier>(context).busy)
            ? const Center(child: CircularProgressIndicator())
            : ElevatedButton(
                onPressed: (Provider.of<TeamNotifier>(context).codeGenerated)
                    ? null
                    : () async {
                        if (teamNameController.text.isNotEmpty) {
                          print("ytresdfghjkbv");
                          final provider =
                              Provider.of<TeamNotifier>(context, listen: false);
                          bool result = await provider.createTeam(teamname);

                          if (result) {
                            // create team successful
                            provider.updateCodeGeneration(true);
                          }
                        } else {
                          // create team failed
                          // TODO: Show alert dialog for create team failed
                        }
                      },
                style: ElevatedButton.styleFrom(
                    primary: const Color(0xFFFF7A01),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 11),
                      child: Text(
                        "Generate Code",
                        style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFFFFFFFF)),
                      ),
                    ),
                  ],
                ),
              ),
        const SizedBox(
          height: 50,
        ),
      ],
    );
  }
}
