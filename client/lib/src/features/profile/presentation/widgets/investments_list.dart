import 'package:client/src/features/profile/domain/investment.dart';
import 'package:flutter/material.dart';

class InvestmentsList extends StatelessWidget {
  final List<Investment> investments;
  const InvestmentsList({super.key, required this.investments});

  @override
  Widget build(BuildContext context) {
    if (investments.isEmpty) {
      return const Center(
        child: Text('Wow, such empty...'),
      );
    }
    return ListView.builder(
      itemCount: investments.length,
      itemBuilder: (context, index) {
        final investment = investments.elementAt(index);
        return Text(investment.amount.toString());
      },
    );
  }
}
