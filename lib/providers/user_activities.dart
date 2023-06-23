import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go2/models/activity.dart';

class UserActivitiesNotifier extends StateNotifier<List<Activity>> {
  UserActivitiesNotifier() : super(const []);

  void addActivity(
    String title,
    String detail,
    File image,
    ActivityLocation location,
  ) {
    final newActivity = Activity(
      title: title,
      detail: detail,
      image: image,
      location: location,
    );
    state = [newActivity, ...state];
  }
}

final userActivitiesProvider =
    StateNotifierProvider<UserActivitiesNotifier, List<Activity>>(
  (ref) => UserActivitiesNotifier(),
);
