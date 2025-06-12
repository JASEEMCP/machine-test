import 'package:app/domain/services/failure.dart';
import 'package:dartz/dartz.dart';

abstract class AuthService {

  Future<Either<MainFailure,String>> loginUser(String phnNo);
  Future<Either<MainFailure,String>> verifyOtp(String phnNo,String otp);
}