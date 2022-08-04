import 'dart:developer';

import 'package:automated_course_plan_generator/bloc/teaching/teaching_cubit.dart';
import 'package:automated_course_plan_generator/components/background.dart';
import 'package:automated_course_plan_generator/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SavedClass extends StatefulWidget {
  const SavedClass({Key? key}) : super(key: key);

  @override
  State<SavedClass> createState() => _SavedClassState();
}

class _SavedClassState extends State<SavedClass> {
  List<String> className = ['Class 1', 'Class 2', 'Class3'];

  @override
  void initState() {
    super.initState();
    BlocProvider.of<TeachingCubit>(context).getTeaching();
  }

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
              child: BlocBuilder<TeachingCubit, TeachingState>(
                builder: (context, state) {
                  if (state is TeachingLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state is TeachingLoaded) {
                    final classList = state.teachingList;
                    if (classList.isEmpty) {
                      return const Center(
                        child: Text('No Data available'),
                      );
                    }
                    return SizedBox(
                      height: MediaQuery.of(context).size.height * .7,
                      width: double.infinity,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: classList.length,
                        itemBuilder: (context, index) =>
                            classBox(index, classList[index].url),
                      ),
                    );
                  }
                  if (state is TeachingError) {
                    log(state.name.toString());
                  }
                  return Container();
                },
              ))
        ],
      ),
    );
  }

  // Widget classBox(clno) {
  Widget classBox(int index, String url) {
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
                    index.toString(),
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
