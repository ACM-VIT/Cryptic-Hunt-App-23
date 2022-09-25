import 'package:cryptic_hunt/Providers/timeline_page_notifier.dart';
import 'package:cryptic_hunt/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../widgets/card.dart';

class Timeline extends StatefulWidget {
  static String id = "Timeline";
  Timeline({Key? key, required this.notifier}) : super(key: key);

  TimelinePageNotifier notifier = TimelinePageNotifier();

  @override
  State<Timeline> createState() => _Timeline();
}

class _Timeline extends State<Timeline> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) => getTimeline());

    super.initState();
  }

  Future<void> getTimeline() async {
    widget.notifier.getQuestionGroups();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBarWidget(
              title: "Timeline",
            ),
            Expanded(
                child: (widget.notifier.busy)
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: RefreshIndicator(
                          onRefresh: getTimeline,
                          child: ListView.builder(
                            itemCount:
                                widget.notifier.timelineObjectList.length,
                            itemBuilder: (context, index) {
                              DateTime temp = DateTime.parse(widget.notifier
                                  .timelineObjectList[index].startTime);
                              DateTime end = temp.add(Duration(
                                  hours: widget.notifier
                                      .timelineObjectList[index].numHours));
                              String day = "";
                              switch (temp.day) {
                                case 1:
                                  day = "1st";
                                  break;
                                case 2:
                                  day = "2nd";
                                  break;
                                case 3:
                                  day = "3rd";
                                  break;
                                default:
                                  day = temp.day.toString() + "th";
                              }
                              return CustomCard(
                                  date: day,
                                  day: DateFormat('EEEE').format(temp),
                                  heading: widget
                                      .notifier.timelineObjectList[index].title,
                                  desc: widget.notifier
                                          .timelineObjectList[index].subTitle ??
                                      "",
                                  time:
                                      "${temp.hour.toString()}:${temp.minute.toString()} - ${end.hour.toString()}:${end.minute.toString()} ");
                            },
                          ),
                        ),
                      )

                // ListView(
                //   padding: const EdgeInsets.all(10),
                //   children: const [
                //     CustomCard(
                //       day: "THU",
                //       date: "25th",
                //       heading: "Speaker Session 1",
                //       desc: "Works ig",
                //       time: "8am-10pm",
                //     ),
                //     CustomCard(
                //       day: "THU",
                //       date: "25th",
                //       heading: "Speaker Session 2",
                //       desc: "idts ... it doesnt work so far",
                //       time: "8am-10pm",
                //     ),
                //     CustomCard(
                //       day: "THU",
                //       date: "25th",
                //       heading: "Speaker Session 3",
                //       desc: "nahi dalte hai",
                //       time: "8am-10pm",
                //     ),
                //     CustomCard(
                //       day: "THU",
                //       date: "25th",
                //       heading: "Speaker Session 4",
                //       desc: "Okay ab chal raha hai",
                //       time: "8am-10pm",
                //     ),
                //   ],
                // ),
                ),
          ],
        ),
      ),
    );
  }
}
