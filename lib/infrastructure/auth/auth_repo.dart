import 'package:app/domain/services/auth_service.dart';
import 'package:app/domain/services/failure.dart';
import 'package:app/infrastructure/env/env.dart';
import 'package:app/resource/api/end_points.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AuthService)
class AuthRepo implements AuthService {
  @override
  Future<Either<MainFailure, String>> loginUser(String phnNo) async {
    try {
      final response = await Dio().get(
        '${Env().apiBaseUrl}${EndPoints.sendOtp}',
        data: {
          {
            "data": {
              "type": "registration_otp_codes",
              "attributes": {
                "phone": phnNo,
              }
            }
          }
        },
      );
      if (response.statusCode == 200) {
        print(response.data);
        return Right('Success');
      } else {
        return Left(MainFailure.client());
      }
    } catch (e) {
      return Left(MainFailure.server());
    }
  }

  @override
  Future<Either<MainFailure, String>> verifyOtp(
      String phnNo, String otp) async {
    // TODO: implement verifyOtp
    throw UnimplementedError();
  }
}
