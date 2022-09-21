import 'package:flutter/material.dart';

class QuestionScreen extends StatelessWidget {
  static String id = 'QuestionScreen';
  const QuestionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back_ios, color: Colors.black),
        title: const Text('Question Prompt'),
        elevation: 0.0,
        backgroundColor: Colors.white,
        shadowColor: Colors.black54,
      ),
      body: Column(),
    );
  }
}
