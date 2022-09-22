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
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        width: double.infinity,
        child: Card(
          color: Colors.transparent,
          elevation: 0,
          borderOnForeground: true,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
              side: BorderSide(color: Theme.of(context).primaryColor)),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      questionGroup.name,
                      style: Theme.of(context)
                          .textTheme
                          .headline1
                          ?.copyWith(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      questionGroup.numQuestionsSolvedQuestionGroup.toString() +
                          "/" +
                          questionGroup.numberOfQuestions.toString() +
                          " Questions solved",
                      style: Theme.of(context).textTheme.subtitle1,
                    )
                  ],
                ),
                Icon(Icons.arrow_forward_ios)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
