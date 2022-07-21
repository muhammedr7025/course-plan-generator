import 'package:automated_course_plan_generator/components/background.dart';
import 'package:automated_course_plan_generator/constants.dart';
import 'package:flutter/material.dart';

class CourseAdd extends StatefulWidget {
  const CourseAdd({Key? key}) : super(key: key);

  @override
  State<CourseAdd> createState() => _CourseAddState();
}

class _CourseAddState extends State<CourseAdd> {
  @override
  Widget build(BuildContext context) {
    return Background(
        child: Column(
      children: [
        ListTile(
          title: const Text(
            'Add Course',
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
        const Expanded(
          child: SizedBox(),
        ),
        Padding(
          padding: const EdgeInsets.all(25.0),
          child: ElevatedButton(
            onPressed: () {},
            style:
                ElevatedButton.styleFrom(primary: kPrimaryColor, elevation: 0),
            child: Text(
              "Save".toUpperCase(),
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    ));
  }
}
