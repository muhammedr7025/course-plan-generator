import 'dart:developer';

import 'package:automated_course_plan_generator/bloc/classroom/classroom_cubit.dart';
import 'package:automated_course_plan_generator/model/create_class_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

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
  TextEditingController customeHolidays = TextEditingController();

  DateTime? startingDate = DateTime.now();
  DateTime? endingDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Background(
        child: SingleChildScrollView(
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
                    child: GestureDetector(
                      onTap: () async {
                        final today = DateTime.now();
                        final picked = await showDatePicker(
                          context: context,
                          initialDate: today,
                          firstDate: today,
                          lastDate: today.add(const Duration(days: 365)),
                        );
                        if (picked != null) {
                          setState(() => startingDate = picked);
                        }
                      },
                      child: AbsorbPointer(
                        child: TextFormField(
                          key: ValueKey<DateTime>(
                              startingDate ?? DateTime.now()),
                          initialValue:
                              DateFormat('yyyy-MM-dd').format(startingDate!),
                          validator: (_) => startingDate == null
                              ? '* Please select a date'
                              : null,
                          keyboardType: TextInputType.name,
                          textInputAction: TextInputAction.next,
                          cursorColor: kPrimaryColor,
                          decoration: const InputDecoration(
                            border:
                                OutlineInputBorder(borderSide: BorderSide.none),
                          ),
                        ),
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
                    child: SizedBox(
                      height: 50,
                      width: 200,
                      child: GestureDetector(
                        onTap: () async {
                          final today = DateTime.now();
                          final picked = await showDatePicker(
                            context: context,
                            initialDate: today,
                            firstDate: today,
                            lastDate: today.add(const Duration(days: 365)),
                          );
                          if (picked != null) {
                            setState(() => endingDate = picked);
                          }
                        },
                        child: AbsorbPointer(
                          child: TextFormField(
                            key: ValueKey<DateTime>(
                                endingDate ?? DateTime.now()),
                            initialValue:
                                DateFormat('yyyy-MM-dd').format(endingDate!),
                            validator: (_) => endingDate == null
                                ? '* Please select a date'
                                : null,
                            keyboardType: TextInputType.name,
                            textInputAction: TextInputAction.next,
                            cursorColor: kPrimaryColor,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none),
                            ),
                          ),
                        ),
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
                  controller: customeHolidays,
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
          BlocConsumer<ClassroomCubit, ClassroomState>(
            listener: (context, state) {
              if (state is ClassroomLoaded) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('You are Successfully created.'),
                  ),
                );
              }
              if (state is ClassroomError) {
                log(state.error);
                Navigator.of(context).pop();
                BlocProvider.of<ClassroomCubit>(context).getClassrooms();
              }
            },
            builder: (context, state) {
              if (state is ClassroomLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              return Padding(
                padding: const EdgeInsets.all(25.0),
                child: ElevatedButton(
                  onPressed: () async {
                    final CreateClassModel classroom = CreateClassModel(
                      name: semName.text,
                      startDate: DateFormat('yyyy-MM-dd').format(startingDate!),
                      endDate: DateFormat('yyyy-MM-dd').format(endingDate!),
                      customHolidays: customeHolidays.text,
                      weekHolidays: [5, 6],
                    );
                    print(classroom.toJson());
                    BlocProvider.of<ClassroomCubit>(context)
                        .createClassroom(classroomModel: classroom);
                  },
                  style: ElevatedButton.styleFrom(
                      primary: kPrimaryColor, elevation: 0),
                  child: Text(
                    "Save".toUpperCase(),
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    ));
  }
}
