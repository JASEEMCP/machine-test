part of 'user_list_cubit.dart';

@freezed
class UserListState with _$UserListState {
  const factory UserListState.initial() = _Initial;
  const factory UserListState.loading() = _Loading;
  const factory UserListState.success() = _Success;
  const factory UserListState.error() = _Error;
}

extension UserListStateX on UserListState{

  bool  get isLoading => this is _Loading;
  bool  get isError => this is _Error;
  bool  get isSuccess => this is _Success;

}
