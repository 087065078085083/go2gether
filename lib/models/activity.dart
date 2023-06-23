import 'dart:io';

import 'package:uuid/uuid.dart';

const uuid = Uuid();

class ActivityLocation {
  const ActivityLocation({
    required this.latitude,
    required this.longitude,
    required this.address,
  });

  final double latitude;
  final double longitude;
  final String address;
}

class Activity {
  Activity({
    required this.title,
    required this.detail,
    required this.image,
    required this.location,
  }) : id = uuid.v4();
  final String id;
  final String title;
  final String detail;
  final File image;
  final ActivityLocation location;
}
