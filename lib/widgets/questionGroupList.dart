import 'package:cryptic_hunt/Providers/google_sign_in_provider.dart';
import 'package:cryptic_hunt/Providers/question_group_list_notifier.dart';
import 'package:cryptic_hunt/Providers/question_screen_notifier.dart';
import 'package:cryptic_hunt/Providers/sequence_question_screen_notifier.dart';
import 'package:cryptic_hunt/Providers/standalone_question_screen_notifier.dart';
import 'package:cryptic_hunt/data/question_group.dart';
import 'package:cryptic_hunt/screens/multiple_question_screen.dart';
import 'package:cryptic_hunt/screens/question_screen.dart';
import 'package:cryptic_hunt/screens/standalone_question_screen.dart';
import 'package:cryptic_hunt/widgets/questionGroupListItem.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
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
    WidgetsBinding.instance.addPostFrameCallback((_) => getQuestionGroup());

    super.initState();
  }

  Future<void> getQuestionGroup() async {
    widget.state.getQuestionGroups();
  }

  GestureDetector _detector(
      {required Widget child, required QuestionGroup questionGroup}) {
    return GestureDetector(
      onTap: () {
        // if (questionGroup.numberOfQuestions == 1) {
        //   Navigator.push(
        //       context,
        //       MaterialPageRoute(
        //         builder: (context) => ChangeNotifierProvider(
        //           create: (context) => StandaloneQuestionScreenNotifier(),
        //           builder: (context, child) =>
        //               Consumer<StandaloneQuestionScreenNotifier>(
        //             builder: (context, value, child) =>
        //                 StandaloneQuestionScreen(
        //                     notifier: value,
        //                     questionGroupDetailId: questionGroup.id),
        //           ),
        //         ),
        //       )).then((value) => widget.state.getQuestionGroups());
        // } else if (questionGroup.isSequence) {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChangeNotifierProvider(
                create: (context) => QuestionScreenNotifier(),
                builder: (context, child) => Consumer<QuestionScreenNotifier>(
                  builder: (context, value, child) => QuestionScreen(
                      notifier: value, questionGroupDetailId: questionGroup.id),
                ),
              ),
            )).then((value) => widget.state.getQuestionGroups());
        //   } else {
        //     Navigator.pushNamed(context, MultipleQuestionScreen.id);
        //   }
      },
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return (widget.state.busy)
        ? Center(
            child: CircularProgressIndicator(),
          )
        : RefreshIndicator(
            onRefresh: getQuestionGroup,
            child: ListView.builder(
              itemCount: widget.state.questionGroups.length,
              itemBuilder: (context, index) => _detector(
                questionGroup: widget.state.questionGroups[index],
                child: QuestionGroupListItem(
                    questionGroup: widget.state.questionGroups[index]),
              ),
            ),
          );
  }
}
