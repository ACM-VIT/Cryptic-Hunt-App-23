import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HamburgerItem extends StatelessWidget {
  const HamburgerItem(
      {Key? key, required this.svgPicture, required this.text, this.onTap})
      : super(key: key);

  final SvgPicture svgPicture;
  final String text;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: svgPicture,
      title: Text(text,
          style: Theme.of(context).textTheme.subtitle1?.copyWith(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.w500)),
      onTap: onTap,
    );
  }
}
