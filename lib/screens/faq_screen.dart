import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:getwidget/components/accordion/gf_accordion.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cryptic_hunt/constants.dart';

import '../widgets/custom_app_bar.dart';

class FaqSection extends StatelessWidget {
  const FaqSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 35),
      children: [
        const SizedBox(height: 25),
        Center(
          child: Text(
            "About Us",
            style: Theme.of(context)
                .textTheme
                .headline1
                ?.copyWith(color: const Color(0xFFFF8618), fontSize: 20),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
            "Vestibulum dictum ultrices elit a luctus. Sed in ante ut leo congue posuere at sit amet ligula. Pellentesque eget augue nec nisl sodales blandit sed et sem. Aenean quis finibus arcu, in hendreri",
            style: GoogleFonts.inter(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: const Color(0xFF000000))),
        const SizedBox(
          height: 42,
        ),
        SvgPicture.asset('assets/faq/faq_owl.svg'),
        const SizedBox(
          height: 41,
        ),
        Text(
          "FAQ",
          style: Theme.of(context)
              .textTheme
              .headline1
              ?.copyWith(color: const Color(0xFFFF8618), fontSize: 20),
        ),
        const SizedBox(height: 20),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return ExpansionTile(
              title: Text(
                faqList[index]['question'],
                style: Theme.of(context)
                    .textTheme
                    .subtitle1
                    ?.copyWith(fontSize: 15),
              ),
              children: [
                ListTile(
                  title: Text(
                    faqList[index]['answer'],
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1
                        ?.copyWith(fontSize: 12),
                  ),
                ),
              ],
            );
          },
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
          itemCount: faqList.length,
        ),
        const SizedBox(height: 40),
      ],
    );
  }
}

class FaqScreen extends StatelessWidget {
  static String id = 'FaqScreen';
  FaqScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            CustomAppBarWidget(title: 'FAQs'),
            Expanded(child: FaqSection()),
          ],
        ),
      ),
    );
  }
}

// class FaqScreen extends StatelessWidget {
//   static String id = 'FaqScreen';
//   const FaqScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: Column(
//           children: [
//             CustomAppBarWidget(title: 'FAQs'),
//             Expanded(
//               child: ListView(
//                 padding: const EdgeInsets.symmetric(horizontal: 35),
//                 children: [
//                   const SizedBox(height: 45),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Text(
//                         "About Us",
//                         style: Theme.of(context).textTheme.headline1?.copyWith(
//                             color: const Color(0xFFFF8618), fontSize: 20),
//                       ),
//                       const SizedBox(
//                         height: 16,
//                       ),
//                       Text(
//                           "Vestibulum dictum ultrices elit a luctus. Sed in ante ut leo congue posuere at sit amet ligula. Pellentesque eget augue nec nisl sodales blandit sed et sem. Aenean quis finibus arcu, in hendreri",
//                           style: GoogleFonts.inter(
//                               fontWeight: FontWeight.w400,
//                               fontSize: 14,
//                               color: const Color(0xFF000000))),
//                       const SizedBox(
//                         height: 42,
//                       ),
//                       SvgPicture.asset('assets/faq/faq_owl.svg'),
//                       const SizedBox(
//                         height: 41,
//                       ),
//                     ],
//                   ),
//                   const SizedBox(
//                     height: 40,
//                   ),
//                   Text("FAQ",
//                       style: GoogleFonts.poppins(
//                           fontWeight: FontWeight.w600,
//                           fontSize: 20,
//                           color: const Color(0xFFFF8618))),
//                   const SizedBox(
//                     height: 16,
//                   ),
//                   const DropDownItem(
//                     title: "Class aptent  euko usos?",
//                     content:
//                         "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ornare suspendisse mi rhoncus ornare cras. Scelerisque aliquam sed arcu quis diam donec.",
//                   ),
//                   const Divider(
//                     thickness: 1,
//                     color: Color(0xFF000000),
//                   ),
//                   const DropDownItem(
//                     title: "Class aptent taciti inc epta euko usos?",
//                     content:
//                         "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ornare suspendisse mi rhoncus ornare cras. Scelerisque aliquam sed arcu quis diam donec.",
//                   ),
//                   const Divider(
//                     thickness: 1,
//                     color: Color(0xFF000000),
//                   ),
//                   const DropDownItem(
//                     title: "Class aptent taciti inc epta euko usos?",
//                     content:
//                         "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ornare suspendisse mi rhoncus ornare cras. Scelerisque aliquam sed arcu quis diam donec.",
//                   ),
//                   const Divider(
//                     thickness: 1,
//                     color: Color(0xFF000000),
//                   ),
//                   const DropDownItem(
//                     title: "Class aptent taciti inc epta euko usos?",
//                     content:
//                         "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ornare suspendisse mi rhoncus ornare cras. Scelerisque aliquam sed arcu quis diam donec.",
//                   ),
//                   const Divider(
//                     thickness: 1,
//                     color: Color(0xFF000000),
//                   ),
//                   const DropDownItem(
//                     title: "Class aptent taciti inc epta euko usos?",
//                     content:
//                         "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ornare suspendisse mi rhoncus ornare cras. Scelerisque aliquam sed arcu quis diam donec.",
//                   ),
//                   const Divider(
//                     thickness: 1,
//                     color: Color(0xFF000000),
//                   ),
//                   const DropDownItem(
//                     title: "Class aptent taciti inc epta euko usos?",
//                     content:
//                         "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ornare suspendisse mi rhoncus ornare cras. Scelerisque aliquam sed arcu quis diam donec.",
//                   ),
//                   const Divider(
//                     thickness: 1,
//                     color: Color(0xFF000000),
//                   ),
//                   const DropDownItem(
//                     title: "Class aptent taciti inc epta euko usos?",
//                     content:
//                         "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ornare suspendisse mi rhoncus ornare cras. Scelerisque aliquam sed arcu quis diam donec.",
//                   ),
//                   const Divider(
//                     thickness: 1,
//                     color: Color(0xFF000000),
//                   ),
//                   const DropDownItem(
//                     title: "Class aptent taciti inc epta euko usos?",
//                     content:
//                         "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ornare suspendisse mi rhoncus ornare cras. Scelerisque aliquam sed arcu quis diam donec.",
//                   ),
//                   const Divider(
//                     thickness: 1,
//                     color: Color(0xFF000000),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class DropDownItem extends StatelessWidget {
  final String title;
  final String content;
  const DropDownItem({Key? key, required this.title, required this.content})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GFAccordion(
      expandedTitleBackgroundColor: const Color(0xFFFFF4EA),
      collapsedTitleBackgroundColor: const Color(0xFFFFF4EA),
      contentBackgroundColor: const Color(0xFFFFF4EA),
      contentPadding: const EdgeInsets.symmetric(horizontal: 0),
      titlePadding: const EdgeInsets.symmetric(vertical: 1),
      titleChild: Text(title,
          style: GoogleFonts.poppins(
              fontWeight: FontWeight.w400,
              fontSize: 15,
              color: const Color(0xFF000000))),
      collapsedIcon: const Icon(Icons.arrow_drop_down),
      expandedIcon: const Icon(Icons.arrow_drop_up),
      contentChild: Text(content,
          style: GoogleFonts.poppins(
              fontWeight: FontWeight.w400,
              fontSize: 12,
              color: const Color(0xFF000000))),
    );
  }
}
