import 'package:client/src/features/startups/domain/responses/search_startup_response.dart';
import 'package:client/src/features/startups/presentation/widgets/startups_list_item.dart';
import 'package:flutter/material.dart';

class StartupsList extends StatelessWidget {
  final SearchStartupResponse startupsResponse;
  const StartupsList({super.key, required this.startupsResponse});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: startupsResponse.data.length,
      itemBuilder: (context, index) {
        final startup = startupsResponse.data[index];
        return StartupsListItem(startup: startup);
      },
    );
  }
}
