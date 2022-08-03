part of 'course_cubit.dart';

@immutable
abstract class CourseState {}

class CourseInitial extends CourseState {}

class CourseLoading extends CourseState {}

class CourseLoaded extends CourseState {
  final List<CourseModel> courseModel;
  CourseLoaded({
    required this.courseModel,
  });
}

class CourseFailed extends CourseState {
  final String error;
  CourseFailed({
    required this.error,
  });
}

class CourseDeleteSuccess extends CourseState {}
