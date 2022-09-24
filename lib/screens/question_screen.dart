import 'package:cryptic_hunt/Providers/question_screen_notifier.dart';
import 'package:cryptic_hunt/data/answer.dart';
import 'package:cryptic_hunt/data/buy_hint.dart';
import 'package:cryptic_hunt/services/qr_scanner.dart';
import 'package:cryptic_hunt/widgets/alerts/alert.dart';
import 'package:cryptic_hunt/widgets/alerts/alreadySubmittedAlert.dart';
import 'package:cryptic_hunt/widgets/alerts/buyHint.Alert.dart';
import 'package:cryptic_hunt/widgets/alerts/partialSuccessAlert.dart';
import 'package:cryptic_hunt/widgets/alerts/showHintAlert.dart';
import 'package:cryptic_hunt/widgets/alerts/successAlert.dart';
import 'package:cryptic_hunt/widgets/alerts/wrongAnswerAlert.dart';
import 'package:cryptic_hunt/widgets/custom_app_bar.dart';
import 'package:cryptic_hunt/widgets/signup/textWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:cryptic_hunt/widgets/alerts/questionLockAlert.dart';
import 'package:cryptic_hunt/widgets/signup/textWidget.dart';
import 'package:url_launcher/url_launcher.dart';

import '../data/hint.dart';
import '../data/question.dart';

class QuestionScreen extends StatefulWidget {
  static String id = "SequenceQuestion";
  QuestionScreen(
      {super.key, required this.notifier, required this.questionGroupDetailId});
  QuestionScreenNotifier notifier;
  String questionGroupDetailId;

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  @override
  final back = SvgPicture.asset('assets/question/back.svg');

  final qrIcon = SvgPicture.asset('assets/question/qr_scan.svg');

  Color bgColor = const Color(0xfffff4ea);

  final String fontFamily = "Poppins";

  late TextEditingController _controller;

  late PageController _pageController;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) => widget.notifier
            .getQuestionGroupDetail(widget.questionGroupDetailId)
            .then((value) {
          initPageController();

          if ((widget.notifier.questionGroupDetail
                      ?.numQuestionsSolvedQuestionGroup ??
                  false) ==
              (widget.notifier.questionGroupDetail?.numberOfQuestions ??
                  true)) {
            _showMyDialog(Alert.alreadySubmitted);
          }
        }));

    _controller = TextEditingController();

    super.initState();
  }

  void initPageController() {
    _pageController = PageController(initialPage: widget.notifier.currentIndex);
  }

  Future<void> _showMyDialog(Alert alert) async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          if (alert == Alert.wrong) {
            return WrongAnswerAlert(onPressed: () {
              Navigator.of(context).pop();
            });
          } else if (alert == Alert.alreadySubmitted) {
            return AlreadySubmittedAlert(onPressed: () {
              Navigator.of(context).pop();
            });
          } else if (alert == Alert.questionLock) {
            return QuestionLockAlert(
                onPressed: () => Navigator.of(context).pop());
          } else if (alert == Alert.partialSubmit) {
            return PartialSuccessAlert(
                onPressed: () => Navigator.of(context).pop());
          } else if (alert == Alert.buyHint) {
            return BuyHintAlert(
              onPressed: () async {
                Hint? hint = await widget.notifier.getHint(BuyHint(
                    widget.questionGroupDetailId,
                    widget.notifier.currentIndex + 1));
                if (hint != null) {
                  Navigator.of(context).pop();
                  _showMyDialog(Alert.showHint);
                }
              },
              cost: widget.notifier.questionGroupDetail!
                      .questions![widget.notifier.currentIndex].costOfHint ??
                  0,
            );
          } else if (alert == Alert.showHint) {
            return HintAlert(
                onPressed: () => Navigator.of(context).pop(),
                hintText: widget.notifier.questionGroupDetail!
                        .questions![widget.notifier.currentIndex].hint ??
                    "error");
          }
          return SuccessAlert(onPressed: () {
            int count = 0;
            Navigator.popUntil(context, (route) {
              return count++ == 2;
            });
          });
        });
  }

  void changePageBy1(int x) {
    //TODO: Write partial dialog
    if (x + widget.notifier.currentIndex < 0) {
      return;
    } else if (x + widget.notifier.currentIndex >=
        (widget.notifier.questionGroupDetail?.questions?.length ?? 0)) {
      if (widget.notifier.currentIndex ==
          (widget.notifier.questionGroupDetail?.numberOfQuestions ?? 1) - 1)
        return;
      _showMyDialog(Alert.questionLock);
      return;
    }
    widget.notifier.changePage(x + widget.notifier.currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: bgColor,
      body: (widget.notifier.busy)
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SafeArea(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomAppBarWidget(title: "Question Prompt"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(16, 16, 16, 0),
                                child: CustomTextWidget(
                                    widget
                                        .notifier
                                        .questionGroupDetail!
                                        .questions![
                                            widget.notifier.currentIndex]
                                        .title,
                                    fontFamily,
                                    FontWeight.w600,
                                    20,
                                    const Color(0xff000000))),
                            Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(16, 4, 16, 16),
                                child: CustomTextWidget(
                                    widget
                                            .notifier
                                            .questionGroupDetail!
                                            .questions![
                                                widget.notifier.currentIndex]
                                            .pointsAwarded
                                            .toString() +
                                        " Points",
                                    fontFamily,
                                    FontWeight.w600,
                                    16,
                                    const Color(0xff8A8A8A)))
                          ],
                        ),
                        Row(
                          children: [
                            IconButton(
                              icon: Icon(
                                Icons.arrow_back_ios_sharp,
                                color: (widget.notifier.currentIndex == 0)
                                    ? Colors.black
                                    : Theme.of(context).primaryColor,
                              ),
                              onPressed: () {
                                changePageBy1(-1);
                              },
                            ),
                            Text(
                              (widget.notifier.currentIndex + 1).toString(),
                              style: Theme.of(context)
                                  .textTheme
                                  .headline1
                                  ?.copyWith(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 20),
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.arrow_forward_ios_sharp,
                                color: (widget.notifier.currentIndex ==
                                        (widget.notifier.questionGroupDetail
                                                    ?.numberOfQuestions ??
                                                1) -
                                            1)
                                    ? Colors.black
                                    : Theme.of(context).primaryColor,
                              ),
                              onPressed: () {
                                changePageBy1(1);
                              },
                            )
                          ],
                        )
                      ],
                    ),
                    Expanded(
                        child: PageView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      controller: _pageController,
                      itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                          child: Scrollbar(
                            child: ListView(
                                padding: EdgeInsets.only(right: 16),
                                children: <Widget>[
                                      Linkify(
                                        text: widget
                                            .notifier
                                            .questionGroupDetail!
                                            .questions![index]
                                            .description,
                                        onOpen: (link) async {
                                          if (await canLaunchUrl(
                                              Uri.parse(link.url))) {
                                            await launchUrl(
                                                Uri.parse(link.url));
                                          } else {
                                            throw 'Could not launch $link';
                                          }
                                        },
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline1
                                            ?.copyWith(fontSize: 18),
                                        linkStyle: Theme.of(context)
                                            .textTheme
                                            .headline1
                                            ?.copyWith(
                                                fontSize: 18,
                                                color: Theme.of(context)
                                                    .primaryColor),
                                      ),
                                    ] +
                                    widget
                                        .notifier
                                        .questionGroupDetail!
                                        .questions![
                                            widget.notifier.currentIndex]
                                        .images
                                        .map<Widget>((e) => Image.network(
                                              e,
                                              fit: BoxFit.contain,
                                            ))
                                        .toList()

                                // CustomTextWidget(
                                //     widget.notifier.questionGroupDetail!
                                //         .questions![index].description,
                                //     fontFamily,
                                //     FontWeight.w600,
                                //     18,
                                //     const Color(0xff181818)),

                                ),
                          )),
                    )),
                    if (!(widget
                                .notifier
                                .questionGroupDetail
                                ?.questions![widget.notifier.currentIndex]
                                .solved ??
                            false) &&
                        widget
                                .notifier
                                .questionGroupDetail
                                ?.questions![widget.notifier.currentIndex]
                                .costOfHint !=
                            null)
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          width: 80,
                          child: TextButton(
                            onPressed: () {
                              if (widget
                                      .notifier
                                      .questionGroupDetail!
                                      .questions![widget.notifier.currentIndex]
                                      .hint ==
                                  null) {
                                _showMyDialog(Alert.buyHint);
                              } else {
                                _showMyDialog(Alert.showHint);
                              }
                            },
                            child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(4, 4, 0, 4),
                                      child: Icon(
                                        Icons.contact_support,
                                        color: Theme.of(context).primaryColor,
                                      )),
                                  Text(
                                    "hint",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: fontFamily,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14),
                                  )
                                ]),
                          ),
                        ),
                      ),
                    if (!(widget.notifier.questionGroupDetail
                            ?.questions![widget.notifier.currentIndex].solved ??
                        false))
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                        child: Text("Enter Text",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                color: const Color(0xff181818),
                                fontFamily: fontFamily,
                                fontWeight: FontWeight.w600,
                                fontSize: 14)),
                      ),
                    if (!(widget.notifier.questionGroupDetail
                            ?.questions![widget.notifier.currentIndex].solved ??
                        false))
                      Padding(
                          padding: const EdgeInsets.fromLTRB(16, 4, 16, 8),
                          child: TextField(
                            controller: _controller,
                            onChanged: ((value) {
                              if (value.isEmpty) {
                                widget.notifier.toggleScanButton(true);
                              } else {
                                widget.notifier.toggleScanButton(false);
                              }
                            }),
                          )),
                    if (!(widget.notifier.questionGroupDetail
                            ?.questions![widget.notifier.currentIndex].solved ??
                        false))
                      (widget.notifier.showScanButton)
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Padding(
                                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                    child: Divider(
                                      color: Color(0xff8A8A8A),
                                      height: 8.0,
                                      thickness: 1.0,
                                    )),
                                Text("or",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: const Color(0xff8A8A8A),
                                        fontFamily: fontFamily,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14)),
                                const Padding(
                                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                    child: Divider(
                                      color: Color(0xff8A8A8A),
                                      height: 8.0,
                                      thickness: 1.0,
                                    ))
                              ],
                            )
                          : Container(),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                      child: ElevatedButton(
                        onPressed: () async {
                          if (!(widget
                                  .notifier
                                  .questionGroupDetail
                                  ?.questions![widget.notifier.currentIndex]
                                  .solved ??
                              false)) {
                            Answer? answer;
                            if (widget.notifier.showScanButton) {
                              await Navigator.of(context)
                                  .push(MaterialPageRoute(
                                builder: (context) => QrScanner(
                                  onScan: (ans) {
                                    answer = Answer(
                                        ans,
                                        widget.notifier.questionGroupDetail!.id,
                                        widget.notifier.currentIndex + 1);
                                  },
                                ),
                              ));
                            } else {
                              answer = Answer(
                                  _controller.text,
                                  widget.notifier.questionGroupDetail!.id,
                                  widget.notifier.currentIndex + 1);
                            }
                            bool x = await widget.notifier.submitAns(answer!);
                            if (x) {
                              await widget.notifier.getQuestionGroupDetail(
                                  widget.questionGroupDetailId);

                              if (widget.notifier.questionGroupDetail
                                      ?.numQuestionsSolvedQuestionGroup ==
                                  widget.notifier.questionGroupDetail
                                      ?.numberOfQuestions)
                                _showMyDialog(Alert.success);
                              else
                                _showMyDialog(Alert.partialSubmit);
                            } else {
                              _showMyDialog(Alert.wrong);
                            }
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            primary: const Color(0xffFF7A01),
                            minimumSize: const Size.fromHeight(40)),
                        child: Center(
                            child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                              Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(4, 16, 8, 16),
                                  child: (!widget.notifier.showScanButton)
                                      ? Icon(
                                          Icons.done,
                                          color: Colors.black,
                                        )
                                      : qrIcon),
                              Text(
                                (!(widget
                                            .notifier
                                            .questionGroupDetail
                                            ?.questions![
                                                widget.notifier.currentIndex]
                                            .solved ??
                                        false))
                                    ? (widget.notifier.showScanButton)
                                        ? "Scan QR Code"
                                        : "Check Your Ans"
                                    : "Your Team has solve this question",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: fontFamily,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14),
                              )
                            ])),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    )
                  ]),
            ),
    );
  }
}
