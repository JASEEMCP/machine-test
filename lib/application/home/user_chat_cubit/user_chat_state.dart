part of 'user_chat_cubit.dart';

@freezed
class UserChatState with _$UserChatState {
  const factory UserChatState.initial() = _Initial;
  const factory UserChatState.loading() = _Loading;
  const factory UserChatState.success() = _Success;
  const factory UserChatState.error() = _Error;
}

extension UserChatStateX on UserChatState{

  bool  get isLoading => this is _Loading;
  bool  get isError => this is _Error;
  bool  get isSuccess => this is _Success;

}
