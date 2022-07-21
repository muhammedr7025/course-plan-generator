import 'package:automated_course_plan_generator/Screens/staff/timetable.dart';
import 'package:automated_course_plan_generator/components/background.dart';
import 'package:automated_course_plan_generator/constants.dart';
import 'package:awesome_dropdown/awesome_dropdown.dart';
import 'package:flutter/material.dart';

class StaffHomeScreen extends StatefulWidget {
  const StaffHomeScreen({Key? key}) : super(key: key);

  @override
  State<StaffHomeScreen> createState() => _StaffHomeScreenState();
}

class _StaffHomeScreenState extends State<StaffHomeScreen> {
  final List<String> _semList = ['S2', 'S4', 'S6'];
  final List<String> _courseList = ['Dbms', 'Coa', 'Os', 'Gt'];

  final courseCtrl = TextEditingController();
  bool _isBackPressedOrTouchedOutSide = false,
      _isDropDownOpened = false,
      _isPanDown = false;
  String _selectedItem = 'Select Semester';
  bool _isBackPressedOrTouchedOutSideC = false,
      _isDropDownOpenedC = false,
      _isPanDownC = false;
  String _selectedItemC = 'Select Course';
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
              child: AwesomeDropDown(
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
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30.0, right: 30.0),
              child: AwesomeDropDown(
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
                    //TODO
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => TimeTable()));
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
