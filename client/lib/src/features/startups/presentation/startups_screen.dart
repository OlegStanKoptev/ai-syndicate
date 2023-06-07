import 'package:client/src/features/startups/application/startup_service.dart';
import 'package:client/src/features/startups/domain/models/full_startup_model.dart';
import 'package:client/src/features/startups/domain/models/short_startup_model.dart';
import 'package:client/src/features/startups/presentation/widgets/startups_list.dart';
import 'package:client/src/routing/routes.dart';
import 'package:client/src/utils/future_data_consumer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';

class StartupsScreen extends HookWidget {
  const StartupsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final invalidateRef = useRef<DataInvalidator?>(null);
    return Scaffold(
      appBar: AppBar(
        title: const Text('AI Syndicate'),
        actions: [
          IconButton(
            onPressed: () async {
              await const ProfileRoute().push(context);
              invalidateRef.value?.invalidate();
            },
            icon: const Icon(Icons.person),
          ),
          IconButton(
            onPressed: () {
              const NotificationsRoute().push(context);
              invalidateRef.value?.invalidate();
            },
            icon: const Icon(Icons.notifications),
          )
        ],
      ),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 500),
          child: FutureDataConsumer(
              load: Provider.of<StartupService>(context, listen: false)
                  .searchStartups,
              data: (response, invalidate) {
                invalidateRef.value = invalidate;
                return Provider.value(
                  value: invalidate,
                  child: FilteredStartupsList(startups: response.data),
                );
              }),
        ),
      ),
    );
  }
}

class FilteredStartupsList extends HookWidget {
  final List<ShortStartupModel> startups;
  const FilteredStartupsList({super.key, required this.startups});

  @override
  Widget build(BuildContext context) {
    final filter = useState<StartupStatus?>(null);
    final data = startups
        .where(
          (element) => filter.value == null || element.status == filter.value,
        )
        .toList();
    final header = Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: DropdownButton(
        isExpanded: true,
        items: [
          const DropdownMenuItem(value: null, child: Text("All")),
          ...StartupStatus.values
              .map((value) => DropdownMenuItem(
                  value: value, child: Text(value.description)))
              .toList(),
        ],
        onChanged: (value) => filter.value = value,
        value: filter.value,
      ),
    );
    return StartupsList(startups: data, header: header);
  }
}
