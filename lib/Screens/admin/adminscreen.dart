import 'package:automated_course_plan_generator/Screens/admin/calendarview.dart';
import 'package:automated_course_plan_generator/Screens/admin/courseview.dart';
import 'package:automated_course_plan_generator/Screens/admin/staffview.dart';
import 'package:automated_course_plan_generator/Screens/changepassword/changepassword.dart';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../../components/background.dart';
import '../../constants.dart';
import '../Welcome/welcome_screen.dart';
import '../about.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({Key? key}) : super(key: key);

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  @override
  Widget build(BuildContext context) {
    return Background(
      child: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            const SizedBox(
              height: 30,
              child: Center(
                child: Text(
                  'ADMIN',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const SizedBox(
              height: 92,
              child: CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(
                    "https://cdn.vectorstock.com/i/1000x1000/31/95/user-sign-icon-person-symbol-human-avatar-vector-12693195.webp"),
              ),
            ),
            const SizedBox(
              height: 10, //just for a padding
            ),
            const SizedBox(
              child: Text(
                "Anoop Abraham",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
              ),
            ),
            const SizedBox(
              height: 6, //just for a padding
            ),
            const SizedBox(
              child: Text(
                "HOD",
                style: TextStyle(fontWeight: FontWeight.normal, fontSize: 20),
              ),
            ),
            const SizedBox(
              height: 25, //just for a padding
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
              child: Column(
                children: [
                  Material(
                    color: kPrimaryLightColor,
                    borderRadius: const BorderRadius.all(Radius.circular(30)),
                    child: InkWell(
                      borderRadius: const BorderRadius.all(Radius.circular(30)),
                      splashColor: kPrimaryColor,
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const About()));
                      },
                      child: Container(
                        height: 50,
                        padding: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        child: Row(
                          children: [
                            SizedBox(
                              height: 30,
                              width: 30,
                              child: Icon(
                                Icons.info,
                                color: Colors.grey[800],
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Text(
                                "About",
                                style: TextStyle(
                                    color: Colors.grey[800],
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                            const SizedBox(
                              width: 30,
                              height: 30,
                              child: Icon(Icons.navigate_next),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Material(
                    color: kPrimaryLightColor,
                    borderRadius: const BorderRadius.all(Radius.circular(30)),
                    child: InkWell(
                      borderRadius: const BorderRadius.all(Radius.circular(30)),
                      splashColor: kPrimaryColor,
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => StaffView()));
                      },
                      child: Container(
                        height: 50,
                        padding: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        child: Row(
                          children: [
                            SizedBox(
                              height: 30,
                              width: 30,
                              child: Icon(
                                Icons.person_add,
                                color: Colors.grey[800],
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Text(
                                "Add Staff",
                                style: TextStyle(
                                    color: Colors.grey[800],
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                            const SizedBox(
                              width: 30,
                              height: 30,
                              child: Icon(Icons.navigate_next),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Material(
                    color: kPrimaryLightColor,
                    borderRadius: const BorderRadius.all(Radius.circular(30)),
                    child: InkWell(
                      borderRadius: const BorderRadius.all(Radius.circular(30)),
                      splashColor: kPrimaryColor,
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => CourseView()));
                      },
                      child: Container(
                        height: 50,
                        padding: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        child: Row(
                          children: [
                            SizedBox(
                              height: 30,
                              width: 30,
                              child: Icon(
                                Icons.edit_note,
                                color: Colors.grey[800],
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Text(
                                "Edit Courses",
                                style: TextStyle(
                                    color: Colors.grey[800],
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                            const SizedBox(
                              width: 30,
                              height: 30,
                              child: Icon(Icons.navigate_next),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Material(
                    color: kPrimaryLightColor,
                    borderRadius: const BorderRadius.all(Radius.circular(30)),
                    child: InkWell(
                      borderRadius: const BorderRadius.all(Radius.circular(30)),
                      splashColor: kPrimaryColor,
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => CalendarView()));
                      },
                      child: Container(
                        height: 50,
                        padding: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        child: Row(
                          children: [
                            SizedBox(
                              height: 30,
                              width: 30,
                              child: Icon(
                                Icons.edit_calendar,
                                color: Colors.grey[800],
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Text(
                                "Edit Semester",
                                style: TextStyle(
                                    color: Colors.grey[800],
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                            const SizedBox(
                              width: 30,
                              height: 30,
                              child: Icon(Icons.navigate_next),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // Material(
                  //   color: kPrimaryLightColor,
                  //   borderRadius: const BorderRadius.all(Radius.circular(30)),
                  //   child: InkWell(
                  //     splashColor: kPrimaryColor,
                  //     borderRadius: const BorderRadius.all(Radius.circular(30)),
                  //     onTap: () {
                  //       Navigator.of(context).push(MaterialPageRoute(
                  //           builder: (context) => const ChangePassword()));
                  //     },
                  //     child: Container(
                  //       height: 50,
                  //       padding: const EdgeInsets.all(10),
                  //       decoration: const BoxDecoration(
                  //           borderRadius:
                  //               BorderRadius.all(Radius.circular(30))),
                  //       child: Row(
                  //         children: [
                  //           SizedBox(
                  //             height: 30,
                  //             width: 30,
                  //             child: Icon(
                  //               Icons.security,
                  //               color: Colors.grey[800],
                  //             ),
                  //           ),
                  //           const SizedBox(
                  //             width: 10,
                  //           ),
                  //           Expanded(
                  //             child: Text(
                  //               "Change Password",
                  //               style: TextStyle(
                  //                   color: Colors.grey[800],
                  //                   fontSize: 18,
                  //                   fontWeight: FontWeight.w400),
                  //             ),
                  //           ),
                  //           const SizedBox(
                  //             width: 30,
                  //             height: 30,
                  //             child: Icon(Icons.navigate_next),
                  //           )
                  //         ],
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // const SizedBox(
                  //   height: 20,
                  // ),
                  Material(
                    color: kPrimaryLightColor,
                    borderRadius: const BorderRadius.all(Radius.circular(30)),
                    child: InkWell(
                      splashColor: kPrimaryColor,
                      borderRadius: const BorderRadius.all(Radius.circular(30)),
                      onTap: () {
                        signout(context);
                      },
                      child: Container(
                        height: 50,
                        padding: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        child: Row(
                          children: [
                            SizedBox(
                              height: 30,
                              width: 30,
                              child: Icon(
                                Icons.logout,
                                color: Colors.grey[800],
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Text(
                                "Logout",
                                style: TextStyle(
                                    color: Colors.grey[800],
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                            const SizedBox(
                              width: 30,
                              height: 30,
                              child: Icon(Icons.navigate_next),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> signout(BuildContext ctx) async {
    final _sharedPrefs = await SharedPreferences.getInstance();
    await _sharedPrefs.clear();
    Navigator.of(ctx).pushAndRemoveUntil(
        MaterialPageRoute(builder: (ctx) => const WelcomeScreen()),
        (route) => false);
  }
}
