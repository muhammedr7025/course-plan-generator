import 'package:flutter/material.dart';

import '../../components/background.dart';
import '../../constants.dart';

class CalendarAdd extends StatefulWidget {
  const CalendarAdd({Key? key}) : super(key: key);

  @override
  State<CalendarAdd> createState() => _CalendarAddState();
}

class _CalendarAddState extends State<CalendarAdd> {
  TextEditingController semName = TextEditingController();
  TextEditingController startDate = TextEditingController();
  TextEditingController endDate = TextEditingController();
  TextEditingController coustomHoliday = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Background(
        child: Column(
      children: [
        ListTile(
          title: const Text(
            'Add Semester',
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
        const SizedBox(
          height: 40,
        ),
        Column(
          children: [
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    "Name:-",
                    style: TextStyle(fontSize: 22),
                  ),
                ),
                const SizedBox(
                  width: 50,
                ),
                SizedBox(
                  height: 50,
                  width: 200,
                  child: TextFormField(
                    controller: semName,
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    cursorColor: kPrimaryColor,
                    decoration: const InputDecoration(
                      hintText: "eg:- S6",
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    "Start Date:-",
                    style: TextStyle(fontSize: 22),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                SizedBox(
                  height: 50,
                  width: 200,
                  child: TextFormField(
                    controller: endDate,
                    keyboardType: TextInputType.datetime,
                    textInputAction: TextInputAction.next,
                    cursorColor: kPrimaryColor,
                    decoration: const InputDecoration(
                      hintText: "eg:- dd/mm/yyyy",
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    "End Date:-",
                    style: TextStyle(fontSize: 22),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                SizedBox(
                  height: 50,
                  width: 200,
                  child: TextFormField(
                    controller: startDate,
                    keyboardType: TextInputType.datetime,
                    textInputAction: TextInputAction.next,
                    cursorColor: kPrimaryColor,
                    decoration: const InputDecoration(
                      hintText: "eg:- dd/mm/yyyy",
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                "Custom Holidays",
                style: TextStyle(fontSize: 22),
              ),
            ),
            SizedBox(
              width: 350,
              height: 300,
              child: TextFormField(
                minLines: 1,
                maxLines: null,
                controller: coustomHoliday,
                keyboardType: TextInputType.multiline,
                textInputAction: TextInputAction.next,
                cursorColor: kPrimaryColor,
                decoration: const InputDecoration(
                  hintText: "eg:- dd/mm/yyyy,dd/mm/yyyy,dd/mm/yyyy",
                ),
              ),
            )
          ],
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
