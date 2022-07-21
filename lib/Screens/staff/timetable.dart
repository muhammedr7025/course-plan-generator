import 'package:flutter/material.dart';

import '../../components/background.dart';
import '../../constants.dart';

class TimeTable extends StatefulWidget {
  const TimeTable({Key? key}) : super(key: key);

  @override
  State<TimeTable> createState() => _TimeTableState();
}

class _TimeTableState extends State<TimeTable> {
  late String indexName;
  @override
  Widget build(BuildContext context) {
    return Background(
        child: Column(
      children: [
        ListTile(
          title: const Text(
            'Select TimeTable',
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
                  title("1st"),
                  period(),
                  period(),
                  period(),
                  period(),
                  period(),
                ],
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 5,
                  ),
                  title("2st"),
                  period(),
                  period(),
                  period(),
                  period(),
                  period(),
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
                  title("3rd"),
                  period(),
                  period(),
                  period(),
                  period(),
                  period(),
                ],
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 5,
                  ),
                  title("4th"),
                  period(),
                  period(),
                  period(),
                  period(),
                  period(),
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
                  title("5th"),
                  period(),
                  period(),
                  period(),
                  period(),
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
                  title("6th"),
                  period(),
                  period(),
                  period(),
                  period(),
                  period(),
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
                  title("7th"),
                  period(),
                  period(),
                  period(),
                  period(),
                  period()
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(25.0),
          child: ElevatedButton(
            onPressed: () {},
            style:
                ElevatedButton.styleFrom(primary: kPrimaryColor, elevation: 0),
            child: Text(
              "generate plan".toUpperCase(),
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
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
          decoration: BoxDecoration(
              color: kPrimaryLightColor,
              borderRadius: const BorderRadius.all(Radius.circular(10))),
        ),
      ),
    );
  }
}
