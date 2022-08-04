import 'package:automated_course_plan_generator/Screens/staff/timetable.dart';
import 'package:automated_course_plan_generator/bloc/classroom/classroom_cubit.dart';
import 'package:automated_course_plan_generator/bloc/course/course_cubit.dart';
import 'package:automated_course_plan_generator/components/background.dart';
import 'package:automated_course_plan_generator/constant/constants.dart';
import 'package:automated_course_plan_generator/constants.dart';
import 'package:automated_course_plan_generator/model/classroom_model.dart';
import 'package:automated_course_plan_generator/model/course_model.dart';
import 'package:awesome_dropdown/awesome_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StaffHomeScreen extends StatefulWidget {
  const StaffHomeScreen({Key? key}) : super(key: key);

  @override
  State<StaffHomeScreen> createState() => _StaffHomeScreenState();
}

class _StaffHomeScreenState extends State<StaffHomeScreen> {
  List<String> _semList = ['S2', 'S4', 'S6'];
  List<String> _courseList = ['Dbms', 'Coa', 'Os', 'Gt'];

  final courseCtrl = TextEditingController();
  bool _isBackPressedOrTouchedOutSide = false,
      _isDropDownOpened = false,
      _isPanDown = false;
  String _selectedItem = 'Select Semester';
  bool _isBackPressedOrTouchedOutSideC = false,
      _isDropDownOpenedC = false,
      _isPanDownC = false;
  String _selectedItemC = 'Select Course';
  List<CourseModel>? courses;
  List<ClassroomModel>? classrooms;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<CourseCubit>(context).getCourses();
    BlocProvider.of<ClassroomCubit>(context).getClassrooms();
  }

  @override
  Widget build(BuildContext context) {
    return Background(
      child: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            const Text(
              'Course Plan Generator',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 190,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30.0, right: 30.0),
              child: BlocBuilder<ClassroomCubit, ClassroomState>(
                builder: (context, state) {
                  if (state is ClassroomLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state is ClassroomLoaded) {
                    classrooms = state.classroomList;
                    List<String> classroomList = [];

                    for (var i = 0; i < classrooms!.length; i++) {
                      classroomList.add(classrooms![i].name);
                    }
                    print(classroomList);
                    _semList = classroomList;
                    return AwesomeDropDown(
                      dropDownBGColor: kPrimaryLightColor,
                      isPanDown: _isPanDown,
                      dropDownList: _semList,
                      dropDownIcon: const Icon(
                        Icons.arrow_drop_down,
                        color: Colors.grey,
                        size: 23,
                      ),
                      selectedItem: _selectedItem,
                      onDropDownItemClick: (selectedItem) {
                        _selectedItem = selectedItem;
                      },
                      dropStateChanged: (isOpened) {
                        _isDropDownOpened = isOpened;
                        if (!isOpened) {
                          _isBackPressedOrTouchedOutSide = false;
                        }
                      },
                    );
                  }
                  return const Text(
                      'Failed to fetch courses, please try again.');
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30.0, right: 30.0),
              child: BlocBuilder<CourseCubit, CourseState>(
                builder: (context, state) {
                  if (state is CourseLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state is CourseLoaded) {
                    courses = state.courseModel;
                    List<String> courseList = [];

                    for (var i = 0; i < courses!.length; i++) {
                      courseList.add(courses![i].name);
                    }
                    print(courseList);
                    _courseList = courseList;
                    return AwesomeDropDown(
                      dropDownBGColor: kPrimaryLightColor,
                      isPanDown: _isPanDownC,
                      dropDownList: _courseList,
                      dropDownIcon: const Icon(
                        Icons.arrow_drop_down,
                        color: Colors.grey,
                        size: 23,
                      ),
                      selectedItem: _selectedItemC,
                      onDropDownItemClick: (selectedItem) {
                        _selectedItemC = selectedItem;
                      },
                      dropStateChanged: (isOpened) {
                        _isDropDownOpenedC = isOpened;
                        if (!isOpened) {
                          _isBackPressedOrTouchedOutSideC = false;
                        }
                      },
                    );
                  }
                  return const Text(
                      'Failed to fetch courses, please try again.');
                },
              ),
            ),
            const SizedBox(
              height: 23,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 33.0, right: 33.0),
              child: Material(
                color: kPrimaryLightColor,
                borderRadius: const BorderRadius.all(Radius.circular(30)),
                child: InkWell(
                  splashColor: kPrimaryColor,
                  borderRadius: const BorderRadius.all(Radius.circular(30)),
                  onTap: () {
                    if (_selectedItemC != 'Select Course' &&
                        _selectedItem != 'Select Semester') {
                      CourseModel courseModel = courses!.singleWhere(
                          (element) => element.name.contains(_selectedItemC));
                      ClassroomModel classroom = classrooms!.singleWhere(
                          (element) => element.name.contains(_selectedItem));
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => TimeTable(
                                classroomUrl: classroom.url,
                                courseUrl: courseModel.url,
                                teacherUrl: 'http://34.222.29.103/users/21/',
                              )));
                    }
                  },
                  child: Container(
                    height: 48,
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Text(
                            "Enter Time Table",
                            style: TextStyle(
                                color: Colors.grey[800],
                                fontSize: 18,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                        const SizedBox(
                          width: 30,
                          height: 30,
                          child: Icon(Icons.arrow_forward),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
