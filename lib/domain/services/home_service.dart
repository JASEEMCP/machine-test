import 'package:app/domain/services/failure.dart';
import 'package:dartz/dartz.dart';

abstract class HomeService {

  Future<Either<MainFailure,String>> getUserList();
  Future<Either<MainFailure,String>> getChatData();
}