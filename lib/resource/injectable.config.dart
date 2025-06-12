// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../application/auth/login_cubit/login_cubit.dart' as _i726;
import '../application/auth/token_cubit/token_cubit.dart' as _i98;
import '../application/auth/verify_otp_cubit/verify_otp_cubit.dart' as _i351;
import '../application/common/theme_cubit/theme_cubit.dart' as _i509;
import '../application/home/user_chat_cubit/user_chat_cubit.dart' as _i1063;
import '../application/home/user_list_cubit/user_list_cubit.dart' as _i818;
import '../domain/app_logic.dart' as _i659;
import '../domain/services/auth_service.dart' as _i171;
import '../domain/services/home_service.dart' as _i350;
import '../infrastructure/auth/auth_repo.dart' as _i1003;
import '../infrastructure/auth/home_repo.dart' as _i525;
import 'api/dio_client.dart' as _i891;
import 'db/pref_info.dart' as _i29;

// initializes the registration of main-scope dependencies inside of GetIt
_i174.GetIt init(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i526.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  gh.lazySingleton<_i98.TokenCubit>(() => _i98.TokenCubit());
  gh.lazySingleton<_i509.ThemeCubit>(() => _i509.ThemeCubit());
  gh.lazySingleton<_i29.PrefInfo>(() => _i29.PrefInfo());
  gh.lazySingleton<_i659.AppLogic>(() => _i659.AppLogic());
  gh.lazySingleton<_i350.HomeService>(() => _i525.HomeRepo());
  gh.lazySingleton<_i171.AuthService>(() => _i1003.AuthRepo());
  gh.factory<_i726.LoginCubit>(() => _i726.LoginCubit(gh<_i171.AuthService>()));
  gh.factory<_i351.VerifyOtpCubit>(
      () => _i351.VerifyOtpCubit(gh<_i171.AuthService>()));
  gh.lazySingleton<_i891.DioClient>(
      () => _i891.DioClient(gh<_i98.TokenCubit>()));
  gh.factory<_i818.UserListCubit>(
      () => _i818.UserListCubit(gh<_i350.HomeService>()));
  gh.factory<_i1063.UserChatCubit>(
      () => _i1063.UserChatCubit(gh<_i350.HomeService>()));
  return getIt;
}
