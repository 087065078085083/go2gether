import 'package:flutter/material.dart';
import 'package:go2/models/activity.dart';
import 'package:go2/screens/activities_detail.dart';

class ActivitiesList extends StatelessWidget {
  const ActivitiesList({super.key, required this.activities});

  final List<Activity> activities;

  @override
  Widget build(BuildContext context) {
    if (activities.isEmpty) {
      return Center(
        child: Text(
          'No activity here',
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
                fontSize: 25,
              ),
        ),
      );
    }

    return ListView.builder(
      itemCount: activities.length,
      itemBuilder: (ctx, index) => ListTile(
        leading: CircleAvatar(
          radius: 26,
          backgroundImage: FileImage(activities[index].image),
        ),
        title: Text(
          activities[index].title,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
        ),
        subtitle: Text(
          activities[index].detail,
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
        ),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (ctx) => ActivityDatailScreen(
                activity: activities[index],
              ),
            ),
          );
        },
      ),
    );
  }
}
