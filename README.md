# github_client_app

A new Flutter application.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Dio
dio是一个强大的Dart Http请求库，支持Restful API、FormData、拦截器、请求取消、Cookie管理、文件上传/下载、超时等。dio的使用方式随着其版本升级可能会发生变化，如果本节所述内容和dio官方有差异，请以dio官方文档为准。
[地址:https://github.com/flutterchina/dio](https://github.com/flutterchina/dio)

##DEMO介绍
demo集成dio库，封装http请求层，封装数据请求层。在业务中经常会在最底层增加一些加密、或者证书验证等等很多情况，所以把http作为底层封装一下，使方便的进行修改。数据请求封装，是为了更好的管理和维护所有的请求。

demo请求的框架如下：

http
├── HttpRequestLevel    封装http请求层
├── RequestDataLevel    封装数据请求层
└── 应用层     调用RequestDataLevel里的方法请求接口


