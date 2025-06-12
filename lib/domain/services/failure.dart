

import 'package:freezed_annotation/freezed_annotation.dart';
part 'failure.freezed.dart';
@freezed
class MainFailure with _$MainFailure{
  const factory MainFailure.client() = _Client;
  const factory MainFailure.server() = _Server;
  const factory MainFailure.unknown() = _Unknown;
}