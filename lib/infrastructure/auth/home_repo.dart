import 'package:app/domain/services/failure.dart';
import 'package:app/domain/services/home_service.dart';
import 'package:app/infrastructure/env/env.dart';
import 'package:app/resource/api/end_points.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: HomeService)
class HomeRepo implements HomeService {
  final dio = Dio(
    BaseOptions(
      baseUrl: Env().apiBaseUrl,
      headers: {
        'Accept': 'application/vnd.api+json',
        'Content-Type': 'application/vnd.api+json',
        'Authorization':
            'Bearer 117|KfuqqNXivj5Kztyf8cqwU11XJXlpmraS0mayLqu58a3bf708'
      },
    ),
  );
  @override
  Future<Either<MainFailure, String>> getUserList() async {
    try {
      final response = await dio.post(
        EndPoints.sendOtp,
        data: {
          "data": {
            "type": "registration_otp_codes",
            "attributes": {"phone": "+91"}
          }
        },
      );
      if (response.statusCode == 200) {
        print(response.statusMessage);
        return Right('Success');
      } else {
        return Left(MainFailure.client());
      }
    } on DioException catch (_) {
      return Left(MainFailure.server());
    }
  }

  @override
  Future<Either<MainFailure, String>> getChatData() async {
    try {
      final response = await dio.post(
        EndPoints.verifyOtp,
        data: {
          "data": {
            "type": "registration_otp_codes",
            "attributes": {
              "phone": "+918080808080",
              "otp": 111111

              //   "device_meta": {
              //     "type": "web",
              //     "name": "HP Pavilion 14-EP0068TU",
              //     "os": "Linux x86_64",
              //     "browser": "Mozilla Firefox Snap for Ubuntu (64-bit)",
              //     "browser_version": "112.0.2",
              //     "user_agent": "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:109.0) Gecko/20100101 Firefox/112.0",
              //     "screen_resolution": "1600x900",
              //     "language": "en-GB"
              //   }
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
    } on DioException catch (_) {
      print(_.response?.data);
      return Left(MainFailure.server());
    }
  }
}
