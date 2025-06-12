
import 'package:app/domain/services/home_service.dart';
import 'package:app/resource/utils/common_lib.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'user_chat_state.dart';
part 'user_chat_cubit.freezed.dart';

@injectable
class UserChatCubit extends Cubit<UserChatState> {
  final HomeService _homeService;
  UserChatCubit(this._homeService) : super(UserChatState.initial());

  void getUserChat() async {
    emit(UserChatState.loading());
    final result = await _homeService.getChatData();
    result.fold(
      (e) => emit(UserChatState.error()),
      (s) => emit(UserChatState.success()),
    );
  }
}
