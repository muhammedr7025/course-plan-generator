import 'package:automated_course_plan_generator/api/repositry/teaching_repositry.dart';
import 'package:automated_course_plan_generator/model/teaching_model.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'teaching_state.dart';

class TeachingCubit extends Cubit<TeachingState> {
  TeachingCubit() : super(TeachingInitial());
  List<TeachingModel> teachingList = [];
  final _teachingRepo = TeachingRepositor();
  getTeaching() async {
    emit(TeachingInitial());
    emit(TeachingLoading());
    try {
      final response = await _teachingRepo.getClassroom();
      teachingList = response;
      emit(TeachingLoaded(teachingList: teachingList));
    } catch (e) {
      emit(TeachingError(name: e.toString()));
    }
  }
}
