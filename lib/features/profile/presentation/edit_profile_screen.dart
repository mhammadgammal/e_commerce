import 'package:e_commerce/core/widgets/default_form_field.dart';
import 'package:flutter/material.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({super.key});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
      ),
      body: ListView(
        padding: EdgeInsetsDirectional.only(top: 5.0, start: 15.0, end: 15.0),
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
      ),
    );
  }
}
