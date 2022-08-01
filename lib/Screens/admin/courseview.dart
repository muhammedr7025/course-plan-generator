import 'dart:developer';

import 'package:automated_course_plan_generator/Screens/admin/courseadd.dart';
import 'package:automated_course_plan_generator/bloc/course/course_cubit.dart';
import 'package:automated_course_plan_generator/components/background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants.dart';

class CourseView extends StatefulWidget {
  const CourseView({Key? key}) : super(key: key);

  @override
  State<CourseView> createState() => _CourseViewState();
}

class _CourseViewState extends State<CourseView> {
  List<String> courseName = [
    'AAD',
    'CD',
    'COA',
    'CGIP',
    'DBMS',
    'ECO',
    'PIP',
  ];

  late int courseno;
  @override
  void initState() {
    super.initState();
    BlocProvider.of<CourseCubit>(context).getCourses();
  }

  @override
  Widget build(BuildContext context) {
    return Background(
        child: Column(
      children: [
        ListTile(
          title: const Text(
            'Courses',
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
        Expanded(child: BlocBuilder<CourseCubit, CourseState>(
          builder: (context, state) {
            if (state is CourseLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is CourseLoaded) {
              final course = state.courseModel;
              log(course.toString());
              return ListView.builder(
                itemCount: course.length,
                itemBuilder: (context, position) {
                  return courseBox(course[position].name);
                },
              );
            }
            if (state is CourseFailed) {
              log(state.error);
            }
            return Container();
          },
        )),
        Padding(
          padding: const EdgeInsets.all(25.0),
          child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const CourseAdd()));
            },
            style:
                ElevatedButton.styleFrom(primary: kPrimaryColor, elevation: 0),
            child: Text(
              "Add Course".toUpperCase(),
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    ));
  }

  Widget courseBox(String name) {
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
                      name,
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
