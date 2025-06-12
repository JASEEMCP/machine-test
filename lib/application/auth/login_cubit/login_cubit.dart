import 'package:app/domain/services/auth_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'login_state.dart';
part 'login_cubit.freezed.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  final AuthService _authService;
  LoginCubit(this._authService) : super(LoginState.initial());

  void loginUser(String phn) async {
    emit(LoginState.loading());
    final result = await _authService.loginUser(phn);
    result.fold(
      (e) => emit(LoginState.error()),
      (s) => emit(LoginState.success()),
    );
  }
}
