import 'dart:developer';

import 'package:automated_course_plan_generator/bloc/teaching/teaching_cubit.dart';
import 'package:automated_course_plan_generator/model/teaching_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../components/background.dart';
import '../../constants.dart';

class TimeTable extends StatefulWidget {
  final String classroomUrl;
  final String teacherUrl;
  final String courseUrl;
  const TimeTable({
    Key? key,
    required this.classroomUrl,
    required this.teacherUrl,
    required this.courseUrl,
  }) : super(key: key);

  @override
  State<TimeTable> createState() => _TimeTableState();
}

class _TimeTableState extends State<TimeTable> {
  List<int> selectedIndex1 = [];
  List<int> selectedIndex2 = [];
  List<int> selectedIndex3 = [];
  List<int> selectedIndex4 = [];
  List<int> selectedIndex5 = [];
  List<int> selectedIndex6 = [];
  List<int> selectedIndex7 = [];
  @override
  Widget build(BuildContext context) {
    return Background(
        child: Column(
      children: [
        // ListTile(
        //   title: const Text(
        //     'Select TimeTable',
        //     style: TextStyle(fontSize: 20),
        //   ),
        //   leading: IconButton(
        //       onPressed: () {
        //         Navigator.of(context).pop();
        //       },
        //       icon: const Icon(
        //         Icons.arrow_back,
        //         size: 27,
        //       )),
        // ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(Icons.arrow_back)),
                const Text(
                  'Select TimeTable',
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
            BlocListener<TeachingCubit, TeachingState>(
              listener: (context, state) {
                if (state is TeachingError) {
                  log(state.name);
                }
              },
              child: OutlinedButton(
                onPressed: () {
                  // final Map<String, dynamic> map = {
                  //   "classroom": widget.classroomUrl,
                  //   "course": widget.courseUrl,
                  //   "periods": {
                  //     "0": selectedIndex1,
                  //     "1": selectedIndex2,
                  //     "2": selectedIndex3,
                  //     "3": selectedIndex4,
                  //     "4": selectedIndex5,
                  //     "5": selectedIndex6,
                  //     "6": selectedIndex7,
                  //   },
                  //   "teacher": widget.teacherUrl
                  // };
                  final TeachingModel teachingModel = TeachingModel(
                      classroom: widget.classroomUrl,
                      course: widget.courseUrl,
                      periods: {
                        "0": selectedIndex1,
                        "1": selectedIndex2,
                        "2": selectedIndex3,
                        "3": selectedIndex4,
                        "4": selectedIndex5,
                        "5": selectedIndex6,
                        "6": selectedIndex7,
                      },
                      teacher: widget.teacherUrl);
                  BlocProvider.of<TeachingCubit>(context)
                      .createTeaching(teachingModel: teachingModel);
                },
                child: const Text(
                  'Create',
                  style: TextStyle(fontSize: 18, color: Colors.blue),
                ),
              ),
            )
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Expanded(
          child: Column(
            children: [
              Row(
                children: [
                  const SizedBox(
                    width: 5,
                  ),
                  title("Prd/Day"),
                  title("Mon"),
                  title("Tue"),
                  title("Wed"),
                  title("Thur"),
                  title("Fri")
                ],
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 5,
                  ),
                  Expanded(flex: 1, child: title("1st")),
                  Expanded(
                    flex: 6,
                    child: GridView.builder(
                      shrinkWrap: true,
                      itemCount: 5,
                      scrollDirection: Axis.vertical,
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 5,
                              crossAxisSpacing: 1.0,
                              mainAxisSpacing: 1.0),
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.only(left: 5.0, top: 5.0),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              if (selectedIndex1.contains(index)) {
                                selectedIndex1.remove(index);

                                log('here in if loop');
                              } else {
                                selectedIndex1.add(index);
                                log('here in else loop');
                              }
                            });
                            print('0 => $selectedIndex1');
                          },
                          child: Container(
                            width: 57,
                            height: 57,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: selectedIndex1.contains(index)
                                    ? Colors.amber[300]
                                    : kPrimaryLightColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 5,
                  ),
                  Expanded(flex: 1, child: title("2st")),
                  Expanded(
                    flex: 6,
                    child: GridView.builder(
                      shrinkWrap: true,
                      itemCount: 5,
                      scrollDirection: Axis.vertical,
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 5,
                              crossAxisSpacing: 1.0,
                              mainAxisSpacing: 1.0),
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.only(left: 5.0, top: 5.0),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              if (selectedIndex2.contains(index)) {
                                selectedIndex2.remove(index);

                                log('here in if loop');
                              } else {
                                selectedIndex2.add(index);
                                log('here in else loop');
                              }
                            });
                            print('1 => $selectedIndex2');
                          },
                          child: Container(
                            width: 57,
                            height: 57,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: selectedIndex2.contains(index)
                                    ? Colors.amber[300]
                                    : kPrimaryLightColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 10.0, top: 5.0, right: 15.0),
                child: Container(
                  color: Colors.green[300],
                  height: 30,
                  width: 400,
                  child: const Center(
                    child: Text('TEA BREAK'),
                  ),
                ),
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 5,
                  ),
                  Expanded(flex: 1, child: title("3rd")),
                  Expanded(
                    flex: 6,
                    child: GridView.builder(
                      shrinkWrap: true,
                      itemCount: 5,
                      scrollDirection: Axis.vertical,
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 5,
                              crossAxisSpacing: 1.0,
                              mainAxisSpacing: 1.0),
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.only(left: 5.0, top: 5.0),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              if (selectedIndex3.contains(index)) {
                                selectedIndex3.remove(index);

                                log('here in if loop');
                              } else {
                                selectedIndex3.add(index);
                                log('here in else loop');
                              }
                            });
                            print('3 => $selectedIndex3');
                          },
                          child: Container(
                            width: 57,
                            height: 57,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: selectedIndex3.contains(index)
                                    ? Colors.amber[300]
                                    : kPrimaryLightColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 5,
                  ),
                  Expanded(flex: 1, child: title("4th")),
                  Expanded(
                    flex: 6,
                    child: GridView.builder(
                      shrinkWrap: true,
                      itemCount: 5,
                      scrollDirection: Axis.vertical,
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 5,
                              crossAxisSpacing: 1.0,
                              mainAxisSpacing: 1.0),
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.only(left: 5.0, top: 5.0),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              if (selectedIndex4.contains(index)) {
                                selectedIndex4.remove(index);

                                log('here in if loop');
                              } else {
                                selectedIndex4.add(index);
                                log('here in else loop');
                              }
                            });
                            print('3 => $selectedIndex4');
                          },
                          child: Container(
                            width: 57,
                            height: 57,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: selectedIndex4.contains(index)
                                    ? Colors.amber[300]
                                    : kPrimaryLightColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 10.0, top: 5.0, right: 15.0),
                child: Container(
                  color: Colors.green[300],
                  height: 30,
                  width: 400,
                  child: const Center(
                    child: Text('LUNCH BREAK'),
                  ),
                ),
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 5,
                  ),
                  Expanded(flex: 1, child: title("5th")),
                  Expanded(
                    flex: 6,
                    child: GridView.builder(
                      shrinkWrap: true,
                      itemCount: 4,
                      scrollDirection: Axis.vertical,
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4,
                              crossAxisSpacing: 1.0,
                              mainAxisSpacing: 1.0),
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.only(left: 5.0, top: 5.0),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              if (selectedIndex5.contains(index)) {
                                selectedIndex5.remove(index);

                                log('here in if loop');
                              } else {
                                selectedIndex5.add(index);
                                log('here in else loop');
                              }
                            });
                            print('4 => $selectedIndex5');
                          },
                          child: Container(
                            width: 57,
                            height: 57,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: selectedIndex5.contains(index)
                                    ? Colors.amber[300]
                                    : kPrimaryLightColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: Container(
                      color: Colors.green[300],
                      width: 58,
                      height: 62,
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 5,
                  ),
                  Expanded(flex: 1, child: title("6th")),
                  Expanded(
                    flex: 6,
                    child: GridView.builder(
                      shrinkWrap: true,
                      itemCount: 5,
                      scrollDirection: Axis.vertical,
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 5,
                              crossAxisSpacing: 1.0,
                              mainAxisSpacing: 1.0),
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.only(left: 5.0, top: 5.0),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              if (selectedIndex6.contains(index)) {
                                selectedIndex6.remove(index);

                                log('here in if loop');
                              } else {
                                selectedIndex6.add(index);
                                log('here in else loop');
                              }
                            });
                            print('6 => $selectedIndex6');
                          },
                          child: Container(
                            width: 57,
                            height: 57,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: selectedIndex6.contains(index)
                                    ? Colors.amber[300]
                                    : kPrimaryLightColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 10.0, top: 5.0, right: 15.0),
                child: Container(
                  color: Colors.green[300],
                  height: 30,
                  width: 400,
                  child: const Center(
                    child: Text('TEA BREAK'),
                  ),
                ),
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 5,
                  ),
                  Expanded(flex: 1, child: title("7th")),
                  Expanded(
                    flex: 6,
                    child: GridView.builder(
                      shrinkWrap: true,
                      itemCount: 5,
                      scrollDirection: Axis.vertical,
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 5,
                              crossAxisSpacing: 1.0,
                              mainAxisSpacing: 1.0),
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.only(left: 5.0, top: 5.0),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              if (selectedIndex7.contains(index)) {
                                selectedIndex7.remove(index);

                                log('here in if loop');
                              } else {
                                selectedIndex7.add(index);
                                log('here in else loop');
                              }
                            });
                            print('6 => $selectedIndex7');
                          },
                          child: Container(
                            width: 57,
                            height: 57,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: selectedIndex7.contains(index)
                                    ? Colors.amber[300]
                                    : kPrimaryLightColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        // Padding(
        //   padding: const EdgeInsets.all(25.0),
        //   child: ElevatedButton(
        //     onPressed: () {},
        //     style: ElevatedButton.styleFrom(
        //         primary: kPrimaryColor, elevation: 0),
        //     child: Text(
        //       "generate plan".toUpperCase(),
        //       style: const TextStyle(color: Colors.white),
        //     ),
        //   ),
        // ),
      ],
    ));
  }

  Widget title(indexName) {
    return Padding(
      padding: const EdgeInsets.only(left: 5.0, top: 5.0),
      child: Container(
        color: Colors.blue[200],
        width: 57,
        height: 57,
        child: Center(child: Text(indexName)),
      ),
    );
  }

  Widget period() {
    return Padding(
      padding: const EdgeInsets.only(left: 5.0, top: 5.0),
      child: GestureDetector(
        onTap: () {
          //TODO
        },
        child: Container(
          width: 57,
          height: 57,
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
              color: kPrimaryLightColor,
              borderRadius: BorderRadius.all(Radius.circular(10))),
        ),
      ),
    );
  }
}
