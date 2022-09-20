import 'package:cryptic_hunt/Providers/question_group_list_notifier.dart';
import 'package:cryptic_hunt/widgets/questionGroupListItem.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class QuestionGroupList extends StatefulWidget {
  QuestionGroupList({super.key, required this.state});
  QuestionGroupListNotifier state;

  @override
  State<QuestionGroupList> createState() => _QuestionGroupListState();
}

class _QuestionGroupListState extends State<QuestionGroupList> {
  @override
  void initState() {
    widget.state.getQuestionGroups("yuu");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return (widget.state.busy)
        ? Center(
            child: CircularProgressIndicator(),
          )
        : ListView.builder(
            itemCount: widget.state.questionGroups.length,
            itemBuilder: (context, index) => QuestionGroupListItem(
                questionGroup: widget.state.questionGroups[index]),
          );
  }
}
