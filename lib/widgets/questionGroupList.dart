import 'package:cryptic_hunt/Providers/google_sign_in_provider.dart';
import 'package:cryptic_hunt/Providers/question_group_list_notifier.dart';
import 'package:cryptic_hunt/widgets/questionGroupListItem.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QuestionGroupList extends StatefulWidget {
  QuestionGroupList({super.key, required this.state});
  QuestionGroupListNotifier state;

  @override
  State<QuestionGroupList> createState() => _QuestionGroupListState();
}

class _QuestionGroupListState extends State<QuestionGroupList> {
  @override
  void initState() {
    init();
    super.initState();
  }

  Future<void> init() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = pref.getString('tokenId');
    widget.state.getQuestionGroups(token!);
  }

  @override
  Widget build(BuildContext context) {
    return (widget.state.busy)
        ? Center(
            child: CircularProgressIndicator(),
          )
        : RefreshIndicator(
            onRefresh: init,
            child: ListView.builder(
              itemCount: widget.state.questionGroups.length,
              itemBuilder: (context, index) => QuestionGroupListItem(
                  questionGroup: widget.state.questionGroups[index]),
            ),
          );
  }
}
