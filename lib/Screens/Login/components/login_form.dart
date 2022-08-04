import 'package:automated_course_plan_generator/Screens/btmnav.dart';
import 'package:automated_course_plan_generator/Screens/staff/staffhomescreen.dart';
import 'package:automated_course_plan_generator/bloc/auth/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../components/already_have_an_account_acheck.dart';
import '../../../constants.dart';
import '../../../main.dart';
import '../../Signup/signup_screen.dart';

class LoginForm extends StatelessWidget {
  LoginForm({
    Key? key,
  }) : super(key: key);

  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        print(state);
        if (state is AuthSuccess) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const BtmNav()),
            (Route<dynamic> route) => false,
          );
        }
        if (state is Authfailed) {
          // print(state.)
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: Colors.red,
            behavior: SnackBarBehavior.floating,
            content: Text(
              'Invalid username or password',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
            margin: EdgeInsets.all(10),
          ));
        }
      },
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
          const SizedBox(height: defaultPadding),
          Hero(
            tag: "login_btn",
            child: ElevatedButton(
              onPressed: () {
                BlocProvider.of<AuthCubit>(context).login(
                  username: _usernameController.text,
                  password: _passwordController.text,
                );
              },
              child: Text(
                "Login".toUpperCase(),
              ),
            ),
          ),
          const SizedBox(height: defaultPadding),
          AlreadyHaveAnAccountCheck(
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const SignUpScreen();
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  void checkStaffLogin(BuildContext ctx) async {
    final _username = _usernameController.text;
    final _password = _passwordController.text;
    if (_username == 'staff' && _password == '1234') {
      final _sharedPrefs = await SharedPreferences.getInstance();
      _sharedPrefs.setString(LOG_KEY, 'stafflog');
      Navigator.pushAndRemoveUntil(
        ctx,
        MaterialPageRoute(builder: (context) => const BtmNav()),
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
