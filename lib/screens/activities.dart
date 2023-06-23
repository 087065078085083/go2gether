import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go2/providers/user_activities.dart';
import 'package:go2/screens/add_activities.dart';
import 'package:go2/widgets/activities_list.dart';

class ActivitiesScreen extends ConsumerWidget {
  const ActivitiesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userActivities = ref.watch(userActivitiesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Activity to Go2gether!'),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (ctx) => const AddActivityScreeen(),
              ),
            );
          },
          icon: const Icon(Icons.add),
        ),
      ),
      body: ActivitiesList(
        activities: userActivities,
      ),
    );
  }
}
