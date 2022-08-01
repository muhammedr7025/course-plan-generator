import 'package:automated_course_plan_generator/api/repositry/login_respositry.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  final _auth = LoginRepositry();
  login({required String username, required String password}) async {
    emit(AuthInitial());
    emit(AuthLoading());
    print('here');
    try {
      final response =
          await _auth.login(username, password).then((value) => print('here'));
      emit(AuthSuccess());
    } catch (e) {
      print(e);
      emit(Authfailed());
    }
  }
}
