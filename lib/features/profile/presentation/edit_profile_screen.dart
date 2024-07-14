import 'package:e_commerce/core/widgets/default_form_field.dart';
import 'package:flutter/material.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({super.key});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        DefaultFormFiled(
            controller: nameController,
            inputType: TextInputType.name,
            fieldLabel: 'Name',
            icon: const Icon(Icons.person_outline),
            validate: (value) => value == null || value.isEmpty
                ? 'You should enter your name'
                : null),
        DefaultFormFiled(
            controller: emailController,
            inputType: TextInputType.emailAddress,
            fieldLabel: 'Email Address',
            icon: const Icon(Icons.email_rounded),
            validate: (value) => value == null || value.isEmpty
                ? 'You should enter your email'
                : !(value.contains('@'))
                    ? 'Your email should contains \'@\''
                    : null)
      ],
    );
  }
}
