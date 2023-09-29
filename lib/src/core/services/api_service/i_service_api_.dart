import 'package:dio/dio.dart';
import 'package:eshop_app/src/core/services/api_service/service_api.dart';

class IClientService implements ClientService {
  @override
  Dio getService() {
    return Dio(
      BaseOptions(
        baseUrl: 'https://dummyjson.com',
      ),
    );
  }
}
