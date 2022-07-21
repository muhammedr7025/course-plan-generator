import 'package:flutter/material.dart';

import '../constants.dart';

class AlreadyHaveAnAccountCheck extends StatelessWidget {
  final bool login;
  final Function? press;
  const AlreadyHaveAnAccountCheck({
    Key? key,
    this.login = true,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          login ? "Are you a admin ? " : "Are you a staff ? ",
          style: const TextStyle(color: kPrimaryColor),
        ),
        GestureDetector(
          onTap: press as void Function()?,
          child: Text(
            login ? "Admin Login" : "Staff Login",
            style: const TextStyle(
              color: kPrimaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}
