import 'package:cryptic_hunt/widgets/signup/textWidget.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CustomAppBarWidget();
  }
}

class CustomAppBarWidget extends StatelessWidget {
  const CustomAppBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: const Color(0xFFFF8619),
        child: Padding(
            padding: const EdgeInsets.fromLTRB(4, 8, 4, 12),
            child: Column(
              children: [
                Row(
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: const Icon(
                        Icons.navigate_before,
                        color: Color(0xff181818),
                      ),
                    ),
                    TextWidget("Profile", "Poppins", FontWeight.w600, 18,
                        const Color(0xff181818))
                  ],
                ),
                Container(
                  height: 1.2,
                  width: double.infinity,
                  color: Colors.black,
                )
              ],
            )));
  }
}
