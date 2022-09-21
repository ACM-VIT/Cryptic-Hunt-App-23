import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:cryptic_hunt/data/question_group.dart';

class QuestionGroupListItem extends StatelessWidget {
  QuestionGroupListItem({super.key, required this.questionGroup});
  QuestionGroup questionGroup;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Card(
        elevation: 0,
        borderOnForeground: true,
        //todo: Change color
        shape: RoundedRectangleBorder(side: BorderSide(color: Colors.amber)),
        child: Row(
          children: [
            Column(
              children: [
                Text(questionGroup.description.substring(0, 20)),
                Text(questionGroup.numberOfQuestions.toString())
              ],
            ),
            Icon(Icons.arrow_forward_ios)
          ],
        ),
      ),
    );
  }
}
