import 'package:flutter/material.dart';
import '../../../constants.dart';

class LoginForm extends StatelessWidget {
  LoginForm({
    Key? key,
  }) : super(key: key);

  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            controller: _usernameController,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            cursorColor: kPrimaryColor,
            obscureText: true,
            onSaved: (email) {},
            decoration: const InputDecoration(
              hintText: "New password",
              prefixIcon: Padding(
                padding: EdgeInsets.all(defaultPadding),
                child: Icon(Icons.lock),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
              controller: _passwordController,
              textInputAction: TextInputAction.done,
              obscureText: true,
              cursorColor: kPrimaryColor,
              decoration: const InputDecoration(
                hintText: "Confirm password",
                prefixIcon: Padding(
                  padding: EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.lock),
                ),
              ),
            ),
          ),
          const SizedBox(height: defaultPadding),
          Hero(
            tag: "login_btn",
            child: ElevatedButton(
              onPressed: () {
                checkStaffLogin(context);
              },
              child: Text(
                "change password".toUpperCase(),
              ),
            ),
          ),
          const SizedBox(height: defaultPadding),
        ],
      ),
    );
  }

  void checkStaffLogin(BuildContext ctx) async {
    final _username = _usernameController.text;
    final _password = _passwordController.text;
    if (_username == _password) {
      //go to home page
      showDialog(
        context: ctx,
        builder: (ctx) => AlertDialog(
          elevation: 5,
          backgroundColor: kPrimaryLightColor,
          title: const Text("Cannot change password"),
          content: const Text("Temporarly this function is un available"),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(ctx).pop();
              },
              child: const Text(
                "okay",
                style: TextStyle(fontSize: 14, color: kPrimaryColor),
              ),
            ),
          ],
        ),
      );
    } else {
      ScaffoldMessenger.of(ctx).showSnackBar(const SnackBar(
        backgroundColor: Colors.red,
        behavior: SnackBarBehavior.floating,
        content: Text(
          'Passwords doesnt match!!',
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
        ),
        margin: EdgeInsets.all(10),
      ));
    }
  }
}
