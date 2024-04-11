import 'package:flutter/material.dart';

import 'default_form_field.dart';

// ignore: must_be_immutable
class TimePicker extends StatelessWidget {
  TimePicker(
      {super.key,
      required this.timePickerController,
      required this.timePickerLabel,
      required this.validation});

  TextEditingController timePickerController;
  final String timePickerLabel;
  final String validation;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showTimePicker(
              context: context, initialTime: TimeOfDay.now())
          .then((value) {
            print(value!.format(context));
            return timePickerController.text = '${value.hour}:${value.minute}:00';
          }),
      child: DefaultFormFiled(
          controller: timePickerController,
          inputType: TextInputType.datetime,
          fieldLabel: 'Time',
          isEnabled: false,
          icon: const Icon(Icons.watch_later),
          validate: (String? value) =>
              value == null || value.isEmpty ? 'Task time is required' : null),
    );
  }
}
