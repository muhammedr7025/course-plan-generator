part of 'teaching_cubit.dart';

@immutable
abstract class TeachingState {}

class TeachingInitial extends TeachingState {}

class TeachingLoading extends TeachingState {}

class TeachingLoaded extends TeachingState {
  final List<TeachingResponseModel> teachingList;
  TeachingLoaded({
    required this.teachingList,
  });
}

class TeachingError extends TeachingState {
  final String name;
  TeachingError({
    required this.name,
  });
}

class TeachingCreatedLoaded extends TeachingState {}

class TeachingDeleteLoaded extends TeachingState {}
