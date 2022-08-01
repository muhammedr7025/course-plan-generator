import 'package:automated_course_plan_generator/bloc/staff/staff_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../constants.dart';

class LoginForm extends StatelessWidget {
  LoginForm({
    Key? key,
  }) : super(key: key);

  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<StaffCubit, StaffState>(
      listener: (context, state) {
        if (state is StaffLoaded) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('You are successfully added a staff')));
          Navigator.of(context).pop();
        }
      },
      child: Form(
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
                  hintText: "Password",
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
                  BlocProvider.of<StaffCubit>(context).createStaff(
                    username: _usernameController.text,
                    password: _passwordController.text,
                  );
                },
                child: Text(
                  "Add staff".toUpperCase(),
                ),
              ),
            ),
            const SizedBox(height: defaultPadding),
          ],
        ),
      ),
    );
  }
}
