// ignore_for_file: depend_on_referenced_packages

import 'package:app/application/auth/login_cubit/login_cubit.dart';
import 'package:app/application/auth/verify_otp_cubit/verify_otp_cubit.dart';
import 'package:app/application/home/user_chat_cubit/user_chat_cubit.dart';
import 'package:app/application/home/user_list_cubit/user_list_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nested/nested.dart';
import 'package:app/application/common/theme_cubit/theme_cubit.dart';
import 'package:app/resource/injectable.dart';

class RegisterCubits {
  List<SingleChildWidget> register() {
    return [
      /*Common providers*/
      BlocProvider(create: (context) => getIt<ThemeCubit>()),
      BlocProvider(create: (context) => getIt<LoginCubit>()),
      BlocProvider(create: (context) => getIt<VerifyOtpCubit>()),
      BlocProvider(create: (context) => getIt<UserListCubit>()),
      BlocProvider(create: (context) => getIt<UserChatCubit>()),
    ];
  }
}
