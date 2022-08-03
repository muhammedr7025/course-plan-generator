import 'package:automated_course_plan_generator/api/repositry/classsroom_repositry.dart';
import 'package:automated_course_plan_generator/model/classroom_model.dart';
import 'package:automated_course_plan_generator/model/create_class_model.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'classroom_state.dart';

class ClassroomCubit extends Cubit<ClassroomState> {
  ClassroomCubit() : super(ClassroomInitial());
  List<ClassroomModel> classroomList = [];
  final _classroomRepo = ClassroomRepositry();
  getClassrooms() async {
    emit(ClassroomInitial());
    emit(ClassroomLoading());
    try {
      final response = await _classroomRepo.getClassroom();
      classroomList = response;
      emit(ClassroomLoaded(classroomList: classroomList));
    } catch (e) {
      emit(ClassroomError(error: e.toString()));
    }
  }

  deleteClassrooms({required String url}) async {
    emit(ClassroomInitial());
    emit(ClassroomLoading());
    try {
      final response = await _classroomRepo.deleteClassroom(url: url);
      emit(ClassroomLoaded(classroomList: classroomList));
    } catch (e) {
      emit(ClassroomError(error: e.toString()));
    }
  }

  createClassroom({required CreateClassModel classroomModel}) async {
    emit(ClassroomInitial());
    emit(ClassroomLoading());
    try {
      final response =
          await _classroomRepo.createClassroom(classroomModel: classroomModel);
      print('response => $response');
      emit(ClassroomLoaded(classroomList: classroomList));
    } catch (e) {
      emit(ClassroomError(error: e.toString()));
    }
  }
}
