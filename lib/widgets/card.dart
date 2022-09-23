import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomCard extends StatefulWidget {
  final String day;
  final String date;
  final String heading;
  final String desc;
  final String time;
  const CustomCard({
    Key? key,
    required this.date,
    required this.day,
    required this.heading,
    required this.desc,
    required this.time,
  }) : super(key: key);

  @override
  State<CustomCard> createState() => _CustomCard();
}

class _CustomCard extends State<CustomCard> {

  @override
  Widget build(BuildContext context) {
    return TimelineTile(
      alignment: TimelineAlign.start,
      isFirst: true,
      indicatorStyle: const IndicatorStyle(
        // indicator: ,
        color: Color.fromRGBO(255, 122, 1, 1),
        padding: EdgeInsets.all(10),
        indicatorXY: 0,
      ),
      afterLineStyle: const LineStyle(
        thickness: 2,
      ),
      endChild: Container(
        margin: const EdgeInsets.fromLTRB(0, 50, 0, 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(25),
                  ),
                ),
                padding: const EdgeInsets.symmetric(vertical: 44),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.day,
                      style: const TextStyle(
                        fontFamily: 'NotoSans',
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      widget.date,
                      style: const TextStyle(
                        fontFamily: 'NotoSans',
                        fontWeight: FontWeight.w700,
                        fontSize: 24,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(255, 255, 255, 1),
                  borderRadius: BorderRadius.horizontal(
                    right: Radius.circular(25),
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.fromLTRB(10, 40, 5, 5),
                      child: Text(
                        widget.heading,
                        style: const TextStyle(
                          fontFamily: 'NotoSans',
                          fontWeight: FontWeight.w600,
                          fontSize: 24,
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.fromLTRB(10, 0, 5, 10),
                      child: Text(
                        widget.desc,
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w300,
                          fontSize: 11,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children:  [
                          const Icon(Icons.calendar_month_outlined),
                          Text(
                            widget.time,
                            style: const TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                              fontSize: 10,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: SvgPicture.asset('assets/Owl-7.svg',height: 50, fit: BoxFit.fitHeight,),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
