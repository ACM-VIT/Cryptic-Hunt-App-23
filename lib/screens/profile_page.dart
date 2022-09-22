import 'package:cryptic_hunt/Providers/profile_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cryptic_hunt/data/user.dart';

class ProfilePage extends StatefulWidget {
  static String id = 'ProfilePage';

  ProfilePage({super.key, required this.state});

  ProfileNotifier state;

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  List<User?> items = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(widget.state.team?.id ?? 'teamId'),
            Text(widget.state.user?.name ?? 'name'),
            Text(widget.state.user?.email ?? 'email'),
            Text(widget.state.team?.points.toString() ?? '0'),
            const Text('Members'),
            (items.isEmpty)
                ? const Center(child: CircularProgressIndicator())
                : Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: items.length,
                      prototypeItem: Text(items.first?.name ?? 'temp'),
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(items[index]?.name ?? 'name'),
                        );
                      },
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    getProfile();
    super.initState();
  }

  Future<void> getProfile() async {
    await widget.state.getUser();
    await widget.state.getTeam();
    items = widget.state.team?.members ?? [];
  }
}
