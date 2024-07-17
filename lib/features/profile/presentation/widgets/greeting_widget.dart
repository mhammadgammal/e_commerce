import 'package:e_commerce/core/theme/app_color.dart';
import 'package:e_commerce/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';

class GreetingWidget extends StatelessWidget {
  const GreetingWidget(
      {super.key, required this.userName, required this.email});

  final String userName;
  final String email;

  @override
  Widget build(BuildContext context) {
    final firstName = userName.split(' ')[0];
    print(firstName);
    final firstNameChar = firstName[0];
    final lastName = userName.split(' ')[1];
    final lastNameChar = lastName[0];
    return Container(
      margin: const EdgeInsetsDirectional.only(
        start: 8.0,
        end: 8.0,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15.0),
          topRight: Radius.circular(15.0),
        ),
      ),
      child: ListTile(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
          leading: CircleAvatar(
            backgroundColor: Colors.grey,
            child: Text('$firstNameChar$lastNameChar'),
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Ahlan $firstName',
                style: AppTextStyle.font17BlackBold,
              ),
              Text(
                email,
                style: const TextStyle(fontSize: 14.5),
              ),
            ],
          ),
          trailing: Container(
            padding: const EdgeInsetsDirectional.all(1.0),
            width: 50.0,
            height: 30.0,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: AppColors.lightGrey),
            child: const Text('Edit',
                style: TextStyle(fontSize: 15.5, color: Colors.black)),
          )),
    );
  }
}
