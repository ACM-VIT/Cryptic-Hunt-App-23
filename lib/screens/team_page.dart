import 'package:cryptic_hunt/Providers/team_notifier.dart';
import 'package:cryptic_hunt/screens/create_team.dart';
import 'package:cryptic_hunt/screens/team_menu_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'join_team.dart';

class TeamPage extends StatefulWidget {
  static String id = 'TeamPage';

  TeamPage({super.key, required this.notifier});

  TeamNotifier notifier;

  @override
  State<TeamPage> createState() => _TeamPageState();
}

class _TeamPageState extends State<TeamPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TeamPageState(pageState: widget.notifier.pageState),
    );
  }
}

class TeamPageState extends StatelessWidget {
  TeamPageState({super.key, required this.pageState});

  PageState pageState;
  @override
  Widget build(BuildContext context) {
    switch (pageState) {
      case PageState.createTeam:
        return Scaffold(body: CreateTeamPage());
      case PageState.joinTeam:
        return Scaffold(body: JoinTeamScreen());
      default:
        return Scaffold(body: TeamMenuPage());
    }
  }
}
