import 'package:automated_course_plan_generator/api/repositry/staff_repositry.dart';
import 'package:automated_course_plan_generator/model/staff_create_model.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'staff_state.dart';

class StaffCubit extends Cubit<StaffState> {
  StaffCubit() : super(StaffInitial());
  final _repo = StaffRepositry();
  createStaff({required String username, required String password}) async {
    emit(StaffInitial());
    emit(StaffLoading());

    try {
      final response = await _repo.create(username, password);
      emit(StaffLoaded());
    } catch (e) {
      emit(Stafffailed(error: e.toString()));
    }
  }

  getStaff() async {
    emit(StaffInitial());
    emit(StaffLoading());

    try {
      final response = await _repo.getStaff();
      emit(GetStaffLoaded(staffList: response));
    } catch (e) {
      emit(Stafffailed(error: e.toString()));
    }
  }
}
