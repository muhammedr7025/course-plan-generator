import 'package:automated_course_plan_generator/api/repositry/course_repositry.dart';
import 'package:automated_course_plan_generator/model/course_model.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'course_state.dart';

class CourseCubit extends Cubit<CourseState> {
  CourseCubit() : super(CourseInitial());
  final courseRepo = CourseRepositry();
  getCourses() async {
    emit(CourseInitial());
    emit(CourseLoading());
    try {
      final response = await courseRepo.getCourses();
      emit(CourseLoaded(courseModel: response));
    } catch (e) {
      emit(CourseFailed(error: e.toString()));
    }
  }

  deleteCourses({required String url}) async {
    emit(CourseInitial());
    emit(CourseLoading());
    try {
      final response = await courseRepo.deleteCourse(url: url);
      emit(CourseDeleteSuccess());
    } catch (e) {
      emit(CourseFailed(error: e.toString()));
    }
  }
}
