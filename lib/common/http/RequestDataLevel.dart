import 'package:dio/dio.dart';
import 'HttpRequestLevel.dart';

class RequestDataLevel {
  factory RequestDataLevel() => _getInstance();
  static RequestDataLevel get instance => _getInstance();
  static RequestDataLevel _instance;
  RequestDataLevel._internal() {
    // 初始化
  }

  static RequestDataLevel _getInstance() {
    if (_instance == null) {
      _instance = new RequestDataLevel._internal();
    }
    return _instance;
  }

//登录接口
   loginRequest(phone, passWord) async {
    Response response;
    try {
      response = await HttpRequestLevel.instance
          .get("https://jsonplaceholder.typicode.com/posts/1", {"phone":phone, "passWord":passWord});
          print(response);
    } catch (e) {
      print(e);
    }
    return response;

  }
  
  //xxx接口
   xxxxRequest(phone, passWord) async {
    Response response;
    try {
      response = await HttpRequestLevel.instance
          .get("https://jsonplaceholder.typicode.com/posts/1", {"phone":phone, "passWord":passWord});
          print(response);
    } catch (e) {
      print(e);
    }
    return response;

  }

}
