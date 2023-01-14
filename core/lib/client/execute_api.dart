import 'dart:async';
import 'dart:io';

import 'package:core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

// Wrapper for API call
Future<Either<Failure, T>> executeApi<T>(Future<T> t) async {
  try {
    final futureCall = await t;
    return Right(futureCall);
  } on DioError catch (e) {
    print("DioError: ${e.error}");
    if (e.error is SocketException) {
      return Left(NetworkFailure(message: "Please check your connection."));
    } else if (e.error is TimeoutException) {
      return Left(TimeoutFailure());
    }
    if (e.response != null) {
      final statusCode = e.response!.statusCode ?? 0;
      if (statusCode == 400) {
        return Left(BadRequestFailure());
      } else if (statusCode == 404) {
        return Left(NotFoundFailure());
      }
    }
    return Left(GeneralFailure());
  } catch (e) {
    return Left(GeneralFailure());
  }
}
