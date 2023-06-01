import 'package:client/src/features/profile/application/profile_service.dart';
import 'package:client/src/features/startups/application/startup_service.dart';
import 'package:client/src/features/startups/domain/models/full_startup_model.dart';
import 'package:client/src/features/startups/presentation/widgets/startups_list.dart';
import 'package:client/src/utils/future_data_consumer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StartupsToBeVerifiedScreen extends StatelessWidget {
  const StartupsToBeVerifiedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Awaiting verification'),
      ),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 500),
          child: Consumer(
            builder: (context, ProfileService profileService, child) =>
                FutureDataConsumer(
              load: () => Provider.of<StartupService>(context, listen: false)
                  .searchStartups(),
              data: (response, _) => StartupsList(
                startups: response.data
                    .where((element) =>
                        element.status == StartupStatus.verification)
                    .toList(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
