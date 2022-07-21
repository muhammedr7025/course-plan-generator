import 'package:automated_course_plan_generator/components/background.dart';
import 'package:flutter/material.dart';

import '../components/background.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Background(
        child: Column(
      children: [
        ListTile(
          title: const Text(
            'About',
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
        Column(
          children: const [
            SizedBox(
              height: 25,
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  'A small software developed to help the teachers to reduce their amount of work and to save their time.',
                  style: TextStyle(fontSize: 19),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  'Developed by:',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            SizedBox(
              height: 3,
            ),
            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Text(
                  '-Adarsh S',
                  style: TextStyle(
                    fontSize: 19,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Text(
                  '-AminDas A',
                  style: TextStyle(
                    fontSize: 19,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Text(
                  '-Jyothir Aditya S',
                  style: TextStyle(
                    fontSize: 19,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Text(
                  '-Kevin Sujith John',
                  style: TextStyle(
                    fontSize: 19,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
          ],
        )
      ],
    ));
  }
}
