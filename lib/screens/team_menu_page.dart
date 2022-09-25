import 'package:cryptic_hunt/Providers/team_notifier.dart';
import 'package:cryptic_hunt/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class TeamMenuPage extends StatelessWidget {
  static String id = 'TeamMenuPage';
  const TeamMenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: SizedBox(), flex: 1),
            SvgPicture.asset(
              'assets/CreateTeam/teamPage.svg',
            ),
            SizedBox(height: 12.0),
            Text('the cryptic hunt',
                style: Theme.of(context).textTheme.headline1),
            Text(
              'Experience the one of a kind hunt with us!',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            Expanded(child: SizedBox(), flex: 2),
            CustomButton(
              buttonText: 'Join Team',
              onTap: () {
                Provider.of<TeamNotifier>(context, listen: false)
                    .updatePageState(PageState.joinTeam);
              },
            ),
            SizedBox(height: 15.0),
            CustomButton(
              buttonText: 'Create Team',
              onTap: () {
                Provider.of<TeamNotifier>(context, listen: false)
                    .updatePageState(PageState.createTeam);
              },
            ),
          ],
        ),
      ),
    );
  }
}
