import 'package:automated_course_plan_generator/Screens/admin/calendaradd.dart';
import 'package:automated_course_plan_generator/components/background.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class CalendarView extends StatefulWidget {
  CalendarView({Key? key}) : super(key: key);

  @override
  State<CalendarView> createState() => _CalendarViewState();
}

class _CalendarViewState extends State<CalendarView> {
  List<String> semName = [
    'S2',
    'S4',
    'S6',
  ];

  late int semno;

  @override
  Widget build(BuildContext context) {
    return Background(
        child: Column(
      children: [
        ListTile(
          title: const Text(
            'Semesters',
            style: TextStyle(fontSize: 27),
          ),
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.arrow_back,
                size: 27,
              )),
        ),
        Expanded(
            child: ListView.builder(
          itemCount: semName.length,
          itemBuilder: (context, position) {
            return semBox(position);
          },
        )),
        Padding(
          padding: const EdgeInsets.all(25.0),
          child: ElevatedButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => CalendarAdd()));
            },
            style:
                ElevatedButton.styleFrom(primary: kPrimaryColor, elevation: 0),
            child: Text(
              "Add Semester".toUpperCase(),
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    ));
  }

  Widget semBox(clno) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15.0),
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Container(
              height: 110,
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                  color: kPrimaryLightColor,
                  borderRadius: BorderRadius.all(Radius.circular(30))),
              child: Row(
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Text(
                      semName[clno],
                      style: TextStyle(
                          color: Colors.grey[800],
                          fontSize: 22,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.delete)),
                ],
              )),
        ],
      ),
    );
  }
}
