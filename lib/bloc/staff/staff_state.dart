part of 'staff_cubit.dart';

@immutable
abstract class StaffState {}

class StaffInitial extends StaffState {}

class StaffLoading extends StaffState {}

class StaffLoaded extends StaffState {}

class Stafffailed extends StaffState {
  final String error;
  Stafffailed({
    required this.error,
  });
}

class GetStaffLoaded extends StaffState {
  final List<StaffCreateModel> staffList;
  GetStaffLoaded({
    required this.staffList,
  });
}
