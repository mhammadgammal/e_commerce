import 'package:e_commerce/core/widgets/default_form_field.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class DatePicker extends StatelessWidget {
  DatePicker(
      {super.key,
      required this.datePickerController,
      required this.datePickerLabel,
      required this.validation,
      this.labelColor = Colors.black,
      this.iconColor = Colors.black,
      this.dateColor = Colors.white});
  TextEditingController datePickerController;
  final String datePickerLabel;
  final String? validation;
  final Color labelColor;
  final Color iconColor;
  final Color dateColor;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.parse('2030-12-31'),
      ).then((value) => //DateFormat.yMMMMd().format(value!)
          datePickerController.text = DateFormat('yyyy-MM-dd').format(value!)),
      child: DefaultFormFiled(
          controller: datePickerController,
          inputType: TextInputType.datetime,
          fieldLabel: datePickerLabel,
          labelColor: labelColor,
          isEnabled: false,
          maxLines: 1,
          textFieldTextColor: dateColor,
          icon: Icon(Icons.calendar_today, color: iconColor,),
          validate: (value) => value == null || value.isEmpty ? validation : null),
    );
  }
}
