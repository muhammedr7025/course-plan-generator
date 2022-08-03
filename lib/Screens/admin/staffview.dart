import 'dart:developer';

import 'package:automated_course_plan_generator/Screens/admin/staffadd.dart';
import 'package:automated_course_plan_generator/bloc/staff/staff_cubit.dart';
import 'package:automated_course_plan_generator/components/background.dart';
import 'package:automated_course_plan_generator/model/staff_create_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants.dart';

class StaffView extends StatefulWidget {
  StaffView({Key? key}) : super(key: key);

  @override
  State<StaffView> createState() => _StaffViewState();
}

class _StaffViewState extends State<StaffView> {
  List<String> staffName = [
    'Nkhil',
    'Bibi',
    'Divya',
    'Nkhil',
    'Bibi',
    'Divya',
    'Nkhil',
    'Bibi',
    'Divya'
  ];

  late int stfno;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<StaffCubit>(context).getStaff();
  }

  @override
  Widget build(BuildContext context) {
    return Background(
        child: Column(
      children: [
        ListTile(
          title: const Text(
            'Staffs',
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
        Expanded(
            child: BlocConsumer<StaffCubit, StaffState>(
          listener: (context, state) {
            if (state is StaffLoaded) {
              BlocProvider.of<StaffCubit>(context).getStaff();
            }
          },
          builder: (context, state) {
            if (state is StaffLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is GetStaffLoaded) {
              List<StaffCreateModel> staff = state.staffList;

              return ListView.builder(
                itemCount: staff.length,
                itemBuilder: (context, position) {
                  return stfBox(staff[position].username, staff[position].url);
                },
              );
            }
            if (state is Stafffailed) {
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
                  MaterialPageRoute(builder: (context) => const StaffAdd()));
            },
            style:
                ElevatedButton.styleFrom(primary: kPrimaryColor, elevation: 0),
            child: Text(
              "Add Staff".toUpperCase(),
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    ));
  }

  Widget stfBox(String staff, String url) {
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
                      staff,
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
                                  title: const Text('Delete User'),
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
                                          BlocProvider.of<StaffCubit>(context)
                                              .deleteStaff(url: url);
                                          Navigator.of(context).pop();
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
