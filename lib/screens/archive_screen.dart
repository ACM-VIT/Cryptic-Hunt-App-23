import 'package:cryptic_hunt/Providers/archive_page_notifier.dart';
import 'package:cryptic_hunt/widgets/questionGroupList.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ArchiveScreen extends StatefulWidget {
  ArchiveScreen({super.key, required this.notifier});
  ArchivePageNotifier notifier;

  @override
  State<ArchiveScreen> createState() => _ArchiveScreenState();
}

class _ArchiveScreenState extends State<ArchiveScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 100,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: QuestionGroupList(
                state: widget.notifier,
                canTap: false,
              ),
            ),
          )
        ],
      ),
    );
  }
}
