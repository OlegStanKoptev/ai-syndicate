import 'package:client/src/features/profile/domain/investment.dart';
import 'package:flutter/material.dart';

class InvestmentsList extends StatelessWidget {
  final Iterable<Investment>? investments;
  const InvestmentsList({super.key, required this.investments});

  @override
  Widget build(BuildContext context) {
    final investments = this.investments;
    if (investments == null || investments.isEmpty) {
      return const Center(
        child: Text('Wow, such empty...'),
      );
    }
    return ListView.builder(
      itemCount: investments.length,
      itemBuilder: (context, index) {
        final investment = investments.elementAt(index);
        return Card(
          child: ListTile(
            title: Text(investment.startupId),
            subtitle: Text('Invested \$${investment.amount}'),
          ),
        );
      },
    );
  }
}
