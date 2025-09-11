import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:findjobs/core/core.dart';

class HttpClientImpl implements HttpClient {
  final Dio _dio;
  HttpClientImpl(this._dio);

  @override
  Future<Either<Failure, T>> post<T>({
    required String url,
    required Map<String, dynamic> data,
    required Future<T> Function(dynamic json) fromJson,
  }) async {
    try {
      final response = await _dio.post(url, data: data);

      log("${response.data}");
      return Right(await fromJson(response.data));
    } on DioException catch (e) {
      final statusCode = e.response?.statusCode;
      final serverMessage = e.response?.data['message'].toString();

      final errorMessage = _mapDioErrorToMessage(e, serverMessage);
      log("$errorMessage code: $statusCode");
      return Left(Failure(message: errorMessage, code: statusCode));
    } catch (e) {
      log("$e");
      return Left(Failure(message: "Unexpected error"));
    }
  }
}

String _mapDioErrorToMessage(DioException e, String? serverMessage) {
  if (serverMessage?.isNotEmpty == true) {
    return serverMessage!;
  }

  final statusCode = e.response?.statusCode;

  switch (e.type) {
    case DioExceptionType.connectionTimeout:
      return "Connection timeout with API server";
    case DioExceptionType.sendTimeout:
      return "Send timeout with API server";
    case DioExceptionType.receiveTimeout:
      return "Receive timeout with API server";
    case DioExceptionType.badResponse:
      if (statusCode == 400) {
        return "Bad request";
      } else if (statusCode == 401) {
        return "Unauthorized";
      } else if (statusCode == 403) {
        return "Forbidden";
      } else if (statusCode == 404) {
        return "Not found";
      } else if (statusCode == 500) {
        return "Internal server error";
      } else {
        return "Received invalid status code: $statusCode";
      }
    case DioExceptionType.cancel:
      return "Request to API server was cancelled";
    case DioExceptionType.connectionError:
      return "Connection to API server failed due to internet connection";
    case DioExceptionType.unknown:
      return "Unexpected error occurred";
    default:
      return "Something went wrong";
  }
}
