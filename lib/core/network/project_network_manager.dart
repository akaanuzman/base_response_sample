import '../model/base_model.dart';
import 'package:dio/dio.dart';

class ProjectNetwrokManager {
  static ProjectNetwrokManager? _instance;
  static ProjectNetwrokManager get instance {
    if (_instance != null)
      return _instance!;
    else {
      _instance = ProjectNetwrokManager.init();
      return _instance!;
    }
  }

  final String _baseUrl = "https://rickandmortyapi.com/api";
  late final Dio dio;

  ProjectNetwrokManager.init() {
    dio = Dio(BaseOptions(baseUrl: _baseUrl));

    dio.interceptors.add(InterceptorsWrapper(onResponse: (e, handler) {
      final data = e.data;

      if (data is Map<String, dynamic>) {
        final model = BaseResponseModel.fromJson(data);
        if (model.info?.count == 0) {
          handler.reject(
            DioError(
              requestOptions: RequestOptions(path: e.realUri.path),
            ),
          );
          return;
        }
        e.data = data['results'];
      }
      handler.next(e);
    }));
  }
}
