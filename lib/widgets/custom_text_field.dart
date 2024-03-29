import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  String hintMsg;
  TextEditingController controller;
  TextInputType inputType;
  CustomTextField(this.hintMsg, this.controller, this.inputType, {Key? key})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => CustomTextFieldState();
}

class CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      keyboardType: widget.inputType,
      decoration: InputDecoration(
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xffff7a01), width: 2),
          borderRadius: BorderRadius.all(Radius.circular(7)),
        ),
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(7))),
        hintText: widget.hintMsg,
      ),
    );
  }
}
