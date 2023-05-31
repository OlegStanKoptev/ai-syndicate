import 'package:client/src/features/startups/domain/models/short_startup_model.dart';
import 'package:client/src/features/startups/presentation/widgets/startups_list_item.dart';
import 'package:flutter/material.dart';

class StartupsList extends StatelessWidget {
  final List<ShortStartupModel> startups;
  final Widget? header;
  const StartupsList({
    super.key,
    required this.startups,
    this.header,
  });

  @override
  Widget build(BuildContext context) {
    if (startups.isEmpty) {
      return const Center(
        child: Text('Wow, such empty...'),
      );
    }
    final length = startups.length + (header != null ? 1 : 0);
    return ListView.builder(
      itemCount: length,
      itemBuilder: (context, index) {
        if (header != null && index == 0) {
          return header;
        }
        final startup = startups.elementAt(index - (header != null ? 1 : 0));
        return StartupsListItem(startup: startup);
      },
    );
  }
}
