import 'package:dio/dio.dart';
import 'package:dukakeen_app/core/networks/dio_config.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dioProvider = Provider<Dio>((ref) {
  return DioConfig().dio;
});
