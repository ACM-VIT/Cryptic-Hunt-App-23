import 'package:flutter/material.dart';

class SpeakerScreen extends StatelessWidget {
  const SpeakerScreen({super.key});
  

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffFFF4EA),
        body: SafeArea(
            child: ListView(
          padding: const EdgeInsets.only(left: 22, right: 22),
          children: [
            Column(  
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20), 
                const TabView(),
                const SizedBox(
                  height: 25,
                ),
                const Text(
                  'See Speakers Speak!',
                  style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff777777),
                      fontFamily: 'Noto Sans'),
                ),
                const SizedBox(
                  height: 25,
                ),
                SingleChildScrollView(
                  child: Wrap(
                    spacing: 17,
                    runSpacing: 12,
                    children: const [
                      SpeakerCard(
                          name: "SS Roy",
                          description:
                              "How to grow a social network How to grow a social network",
                          button: SpeakerCardButton(statusText: 'Live Now!'),),
                      SpeakerCard(
                          name: "SS Roy",
                          description: "How to grow a social network",
                          button: SpeakerCardButton(statusText: 'Event Over'),),
                      SpeakerCard(
                          name: "SS Roy",
                          description: "How to grow a social network",
                          button: SpeakerCardButton(statusText: 'On 27st Sept, 2022'),),
                      SpeakerCard(
                          name: "SS Roy",
                          description: "How to grow a social network",
                          button: SpeakerCardButton(statusText: 'On 27st Sept, 2022'),),
                      SpeakerCard(
                          name: "SS Roy",
                          description: "How to grow a social network",
                          button: SpeakerCardButton(statusText: 'On 27st Sept, 2022'),),
                      SpeakerCard(
                          name: "SS Roy",
                          description: "How to grow a social network",
                          button: SpeakerCardButton(statusText: 'On 27st Sept, 2022'),),
                      SpeakerCard(
                          name: "SS Roy",
                          description: "How to grow a social network",
                          button: SpeakerCardButton(statusText: 'On 27st Sept, 2022'),),
                    ],
                  ),
                ),
              ],
            )
          ],
        )),
      ),
    );
  }
}

class SpeakerCard extends StatelessWidget {
  final String name;
  final String description;
  final SpeakerCardButton button;

  const SpeakerCard(
      {super.key,
      required this.name,
      required this.description,
      required this.button});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 155,
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Column(children: [
            SizedBox(
              width: 139,
              height: 100,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: FittedBox(
                      fit: BoxFit.cover,
                      child: Image.asset("assets/dude1.png"),
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Center(
                  child: Text(
                name,
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                    color: Color(0xff000000),
                    fontFamily: 'Noto Sans'),
                textAlign: TextAlign.center,
              )),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Center(
                  child: Text(
                description,
                style: const TextStyle(
                    fontSize: 9,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff000000),
                    fontStyle: FontStyle.normal,
                    fontFamily: 'Poppins'),
                textAlign: TextAlign.center,
              )),
            ),
            Center(child: button),
            const SizedBox(
              height: 15,
            )
          ]),
        ));
  }
}

class SpeakerCardButton extends StatelessWidget {
  final String statusText;
  const SpeakerCardButton({super.key, required this.statusText});

  Color Colorpicker(String status) {
    if (status == "Event Over") {
      return const Color(0xffAFAFAF);
    } else if (status == "Live Now!") {
      return const Color(0xff6FCF97);
    } else {
      return const Color(0xffFF8618);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 97,
      height: 23,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        color: Colorpicker(statusText),
        child: Center(
          child: Text(
            statusText,
            style: const TextStyle(
                fontSize: 8,
                fontWeight: FontWeight.w500,
                color: Colors.white,
                fontStyle: FontStyle.normal,
                fontFamily: 'Poppins'),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

class TabView extends StatelessWidget {
  const TabView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // padding: const EdgeInsets.symmetric(horizontal: 16),
      height: 36,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: const Color(0xffFF8618),
            width: 1,
          )),
      child: Row(
        children: [
          const Flexible(
              flex: 1,
              child: Center(
                child: Text("Timeline",
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w500,
                      color: Color(0xff000000),
                    )),
              )),
          Flexible(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                    color: const Color(0xffFF8618),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: const Color(0xffFF8618),
                      width: 1,
                    )),
                child: const Center(
                  child: Text("Speakers",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w500,
                        color: Color(0xffFFFFFF),
                      )),
                ),
              ))
        ],
      ),
    );
  }
}
