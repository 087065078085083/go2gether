import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go2/models/activity.dart';
import 'package:go2/providers/user_activities.dart';
import 'package:go2/widgets/image_input.dart';
import 'package:go2/widgets/location_input.dart';

class AddActivityScreeen extends ConsumerStatefulWidget {
  const AddActivityScreeen({super.key});

  @override
  ConsumerState<AddActivityScreeen> createState() {
    return _AddActivityScreenState();
  }
}

class _AddActivityScreenState extends ConsumerState<AddActivityScreeen> {
  final _titleController = TextEditingController();
  final _detailController = TextEditingController();
  File? _selectedImage;
  ActivityLocation? _selectedLocation;

  void _saveActivity() {
    final enteredTitle = _titleController.text;
    final enteredDetail = _detailController.text;

    if (enteredTitle.isEmpty ||
        enteredDetail.isEmpty ||
        _selectedImage == null ||
        _selectedLocation == null) {
      return;
    }

    ref.read(userActivitiesProvider.notifier).addActivity(
          enteredTitle,
          enteredDetail,
          _selectedImage!,
          _selectedLocation!,
        );

    Navigator.of(context).pop();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _detailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add detail about new Activity'),
      ),
      body: SingleChildScrollView(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              TextField(
                decoration: const InputDecoration(labelText: 'Title'),
                controller: _titleController,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Detail'),
                controller: _detailController,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
              ),
              const SizedBox(height: 10),
              //Image Input
              ImageInput(
                onPickImage: (image) {
                  _selectedImage = image;
                },
              ),
              const SizedBox(height: 10),
              LocationInput(
                onSelectLocation: (location) {
                  _selectedLocation = location;
                },
              ),
              const SizedBox(height: 16),
              ElevatedButton.icon(
                onPressed: _saveActivity,
                icon: const Icon(Icons.add),
                label: const Text('Add Activity'),
              ),
            ],
          )),
    );
  }
}
