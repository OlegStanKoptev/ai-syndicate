import 'package:client/src/features/profile/application/profile_service.dart';
import 'package:client/src/features/profile/presentation/widgets/investments_list.dart';
import 'package:client/src/utils/future_data_consumer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyInvestmentsScreen extends StatelessWidget {
  const MyInvestmentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My investments'),
      ),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 500),
          child: Consumer(
            builder: (context, ProfileService profileService, child) =>
                FutureDataConsumer(
              load: () => Provider.of<ProfileService>(context, listen: false)
                  .getInvestments(),
              data: (response, _) =>
                  InvestmentsList(investments: response.investments),
            ),
          ),
        ),
      ),
    );
  }
}
