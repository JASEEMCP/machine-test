part of 'verify_otp_cubit.dart';

@freezed
class VerifyOtpState with _$VerifyOtpState {
  const factory VerifyOtpState.initial() = _Initial;
  const factory VerifyOtpState.loading() = _Loading;
  const factory VerifyOtpState.success() = _Success;
  const factory VerifyOtpState.error() = _Error;
}

extension VerifyOtpStateX on VerifyOtpState{

  bool  get isLoading => this is _Loading;
  bool  get isError => this is _Error;
  bool  get isSuccess => this is _Success;

}
