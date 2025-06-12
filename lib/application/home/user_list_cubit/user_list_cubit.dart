
import 'package:app/domain/services/home_service.dart';
import 'package:app/resource/utils/common_lib.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'user_list_state.dart';
part 'user_list_cubit.freezed.dart';


@injectable
class UserListCubit extends Cubit<UserListState> {
  final HomeService _homeService;
  UserListCubit(this._homeService) : super(UserListState.initial());

  void getUserChat() async {
    emit(UserListState.loading());
    final result = await _homeService.getUserList();
    result.fold(
      (e) => emit(UserListState.error()),
      (s) => emit(UserListState.success()),
    );
  }
}
