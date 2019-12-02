import 'package:dio/dio.dart';

class HttpRequestLevel {
  static Dio _dio;
  var urlString = "https://jsonplaceholder.typicode.com/posts/1";
  // 工厂模式
  factory HttpRequestLevel() => _getInstance();
  static HttpRequestLevel get instance => _getInstance();
  static HttpRequestLevel _instance;
  HttpRequestLevel._internal() {
    // 初始化
    _dio = new Dio();
    _dio.options.baseUrl = urlString;
    _dio.options.connectTimeout = 60000; //60s 链接超时时间
    _dio.options.receiveTimeout = 60000; //60s 接收超时时间
    _dio.options.headers = {};

    _dio.interceptors
        .add(InterceptorsWrapper(onRequest: (RequestOptions options) async {
      // 在请求被发送之前做一些事情
      return options; //continue
      // 如果你想完成请求并返回一些自定义数据，可以返回一个`Response`对象或返回`dio.resolve(data)`。
      // 这样请求将会被终止，上层then会被调用，then中返回的数据将是你的自定义数据data.
      //
      // 如果你想终止请求并触发一个错误,你可以返回一个`DioError`对象，或返回`dio.reject(errMsg)`，
      // 这样请求将被中止并触发异常，上层catchError会被调用。
    }, onResponse: (Response response) async {
      // 在返回响应数据之前做一些预处理
      return response; // continue
    }, onError: (DioError e) async {
      // 当请求失败时做一些预处理
      return e; //continue
    }));
  }
  static HttpRequestLevel _getInstance() {
    if (_instance == null) {
      _instance = new HttpRequestLevel._internal();
    }
    return _instance;
  }

  // get 请求封装
  get(url, dictData) async {
    print('get-url：$url ,body: $dictData');
    Response response;
    try {
      response = await _dio.get(url, queryParameters: {"data": dictData});
    } on DioError catch (e) {
      if (CancelToken.isCancel(e)) {
        print('get请求取消! ' + e.message);
      } else {
        print('get请求发生错误：$e');
      }
    }
    return response;
  }

  // post请求封装
  post(url, data) async {
    print('post请求::: url：$url ,body: $data');
    Response response;

    try {
      response = await _dio.post(
        url,
        data: data != null ? data : {},
      );
      print(response);
    } on DioError catch (e) {
      if (CancelToken.isCancel(e)) {
        print('post请求取消! ' + e.message);
      } else {
        print('post请求发生错误：$e');
      }
    }
    return response;
  }
}
