import 'package:automated_course_plan_generator/components/background.dart';
import 'package:automated_course_plan_generator/constants.dart';
import 'package:flutter/material.dart';

class SavedClass extends StatelessWidget {
  SavedClass({Key? key}) : super(key: key);
  List<String> className = ['Class 1', 'Class 2', 'Class3'];
  late int clno;
  @override
  Widget build(BuildContext context) {
    return Background(
      child: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          const SizedBox(
            height: 30,
            width: double.infinity,
            child: Text(
              textAlign: TextAlign.left,
              '  Saved classes',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
            ),
          ),
          const SizedBox(
            height: 25, //just for a padding
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
            child: Column(
              children: [classBox(0), classBox(1), classBox(2)],
            ),
          )
        ],
      ),
    );
  }

  // Widget classBox(clno) {
  //   return Column(
  //     children: [
  //       const SizedBox(
  //         height: 20,
  //       ),
  //       GestureDetector(
  //         onTap: () {
  //           //TODO
  //         },
  //         child: Container(
  //           height: 110,
  //           padding: const EdgeInsets.all(10),
  //           decoration: BoxDecoration(
  //               color: Colors.blueGrey[100],
  //               borderRadius: const BorderRadius.all(Radius.circular(30))),
  //           child: Row(
  //             children: [
  //               const SizedBox(
  //                 width: 10,
  //               ),
  //               Expanded(
  //                 child: Text(
  //                   className[clno],
  //                   style: TextStyle(
  //                       color: Colors.grey[800],
  //                       fontSize: 22,
  //                       fontWeight: FontWeight.w400),
  //                 ),
  //               ),
  //               const SizedBox(
  //                 width: 40,
  //                 height: 30,
  //                 child: Icon(Icons.visibility),
  //               ),
  //               const SizedBox(
  //                 width: 40,
  //                 height: 30,
  //                 child: Icon(Icons.delete),
  //               )
  //             ],
  //           ),
  //         ),
  //       ),
  //     ],
  //   );
  // }

  Widget classBox(clno) {
    return Column(
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
                    className[clno],
                    style: TextStyle(
                        color: Colors.grey[800],
                        fontSize: 22,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                IconButton(
                    onPressed: () {}, icon: const Icon(Icons.visibility)),
                IconButton(onPressed: () {}, icon: const Icon(Icons.delete)),
              ],
            )),
      ],
    );
  }
}
