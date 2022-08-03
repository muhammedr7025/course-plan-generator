import 'package:automated_course_plan_generator/Screens/admin/calendaradd.dart';
import 'package:automated_course_plan_generator/bloc/classroom/classroom_cubit.dart';
import 'package:automated_course_plan_generator/components/background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
  void initState() {
    super.initState();
    BlocProvider.of<ClassroomCubit>(context).getClassrooms();
  }

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
        Expanded(child: BlocBuilder<ClassroomCubit, ClassroomState>(
          builder: (context, state) {
            if (state is ClassroomLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is ClassroomLoaded) {
              var courseList = state.classroomList;
              return ListView.builder(
                itemCount: courseList.length,
                itemBuilder: (context, position) {
                  return semBox(
                      courseList[position].name, courseList[position].url);
                },
              );
            }
            return Container();
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

  Widget semBox(String name, String url) {
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
                  IconButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  title: const Text('Delete Semester'),
                                  actions: [
                                    MaterialButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text('Cancel'),
                                    ),
                                    SizedBox(
                                      height: 30,
                                      width: 100,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          BlocProvider.of<ClassroomCubit>(
                                                  context)
                                              .deleteClassrooms(url: url);

                                          Navigator.of(context).pop();
                                          BlocProvider.of<ClassroomCubit>(
                                                  context)
                                              .getClassrooms();
                                        },
                                        style: ElevatedButton.styleFrom(
                                            primary: kPrimaryColor,
                                            elevation: 0),
                                        child: const Text(
                                          "Confirm",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ],
                                  content:
                                      const Text('Please Confirm Your action'),
                                ));
                      },
                      icon: const Icon(Icons.delete)),
                ],
              )),
        ],
      ),
    );
  }
}
