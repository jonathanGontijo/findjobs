import 'package:dio/dio.dart';
import 'package:findjobs/configs/constants/env/envs.dart';
import 'package:findjobs/features/shared/infrastruture/infra.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/core.dart';

part 'http_client_provider.g.dart';

@riverpod
HttpClient httpClient(Ref ref) =>
    HttpClientImpl(Dio(BaseOptions(baseUrl: Environment.apiUrl)));
