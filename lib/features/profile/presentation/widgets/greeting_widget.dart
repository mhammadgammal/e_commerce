import 'package:e_commerce/core/router/app_navigator.dart';
import 'package:e_commerce/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';

class GreetingWidget extends StatelessWidget {
  const GreetingWidget(
      {super.key, required this.userName, required this.email});

  final String userName;
  final String email;

  @override
  Widget build(BuildContext context) {
    // final firstName = userName.split(' ')[0];
    // print(firstName);
    // final firstNameChar = firstName[0];
    // final lastName = userName.split(' ')[0];
    // final lastNameChar = lastName[0];
    return Card(
        child: ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.grey,
        child: Text('firstNameCharlastNameChar'),
      ),
      title: Column(
        children: [
          Text(
            'Ahlan firstName',
            style: AppTextStyle.font17BlackBold,
          ),
          Text(email),
        ],
      ),
      trailing: ElevatedButton(
          onPressed: () => AppNavigator.navigateToEditProfile(context),
          child: Container(
            color: Colors.grey,
            child: const Text(
              'Edit',
              style: AppTextStyle.font17BlackBold,
            ),
          )),
    ));
  }
}
