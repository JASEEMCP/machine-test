import 'package:app/domain/services/auth_service.dart';
import 'package:app/resource/utils/common_lib.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'verify_otp_state.dart';
part 'verify_otp_cubit.freezed.dart';

@injectable
class VerifyOtpCubit extends Cubit<VerifyOtpState> {
  final AuthService _authService;
  VerifyOtpCubit(this._authService) : super(VerifyOtpState.initial());

  void verifyOtp(String phn, String otp) async {
    emit(VerifyOtpState.loading());
    final result = await _authService.verifyOtp(phn, otp);
    result.fold(
      (e) => emit(VerifyOtpState.error()),
      (s) => emit(VerifyOtpState.success()),
    );
  }
}
