import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../components/already_have_an_account_acheck.dart';
import '../../../constants.dart';
import '../../../main.dart';
import '../../Login/login_screen.dart';
import '../../admin/adminscreen.dart';

class SignUpForm extends StatelessWidget {
  SignUpForm({
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
            onSaved: (email) {},
            decoration: const InputDecoration(
              hintText: "Username",
              prefixIcon: Padding(
                padding: EdgeInsets.all(defaultPadding),
                child: Icon(Icons.person),
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
                hintText: "Your password",
                prefixIcon: Padding(
                  padding: EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.lock),
                ),
              ),
            ),
          ),
          const SizedBox(height: defaultPadding / 2),
          ElevatedButton(
            onPressed: () {
              checkAdminLogin(context);
            },
            child: Text("Login".toUpperCase()),
          ),
          const SizedBox(height: defaultPadding),
          AlreadyHaveAnAccountCheck(
            login: false,
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const LoginScreen();
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  void checkAdminLogin(BuildContext ctx) async {
    final _username = _usernameController.text;
    final _password = _passwordController.text;
    if (_username == 'admin' && _password == '1234') {
      final _sharedPrefs = await SharedPreferences.getInstance();
      _sharedPrefs.setString(LOG_KEY, 'adminlog');
      Navigator.pushAndRemoveUntil(
        ctx,
        MaterialPageRoute(builder: (context) => AdminScreen()),
        (Route<dynamic> route) => false,
      );

      //go to home page
    } else {
      ScaffoldMessenger.of(ctx).showSnackBar(const SnackBar(
        backgroundColor: Colors.red,
        behavior: SnackBarBehavior.floating,
        content: Text(
          'Invalid username or password',
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
        ),
        margin: EdgeInsets.all(10),
      ));
    }
  }
}
