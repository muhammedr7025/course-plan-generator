import 'dart:convert';
import 'dart:developer';

import 'package:automated_course_plan_generator/api/repositry/teaching_repositry.dart';
import 'package:automated_course_plan_generator/model/teaching_model.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'teaching_state.dart';

class TeachingCubit extends Cubit<TeachingState> {
  TeachingCubit() : super(TeachingInitial());
  List<TeachingResponseModel> teachingList = [];
  final _teachingRepo = TeachingRepositor();
  getTeaching() async {
    emit(TeachingInitial());
    emit(TeachingLoading());
    try {
      final response = await _teachingRepo.getteaching();
      teachingList = response;
      emit(TeachingLoaded(teachingList: teachingList));
    } catch (e) {
      emit(TeachingError(name: e.toString()));
    }
  }

  createTeaching({required TeachingModel teachingModel}) async {
    emit(TeachingInitial());
    emit(TeachingLoading());
    try {
      final response =
          await _teachingRepo.createClassroom(teachingMap: teachingModel);
      final res = TeachingModel.fromJson(json.decode(response.data));
      log(res.toString());
      emit(TeachingCreatedLoaded());
    } catch (e) {
      emit(TeachingError(name: e.toString()));
      throw Exception(e);
    }
  }
}
