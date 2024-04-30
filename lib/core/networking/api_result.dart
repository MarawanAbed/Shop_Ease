import 'package:freezed_annotation/freezed_annotation.dart';
import '/core/networking/exception.dart';

part 'api_result.freezed.dart';
@Freezed()
abstract class ApiResult<T> with _$ApiResult<T> {
  const factory ApiResult.success(T data) = Success<T>;
  const factory ApiResult.failure(Failures error) = Failure<T>;
}