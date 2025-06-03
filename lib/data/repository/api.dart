import 'dart:async';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:attandenceadmin/components/snackbar.dart';
import 'package:attandenceadmin/data/repository/api_urls.dart';
import 'package:attandenceadmin/components/custom_loading.dart';
import 'package:attandenceadmin/config/Router/routing_service.dart';
import 'package:attandenceadmin/data/controllers/user_controller.dart';

class Api {
  final commonHeader = {
    "Authorization": 'Bearer ${userController.token.value}',
  };

  static final authHeader = {'accept': "application/json"};

  Dio api = Dio(BaseOptions(baseUrl: baseUrl, contentType: "application/json"));
  Future<dynamic> request({
    required String url,
    required RequestMethod method,
    Object? payload,
    BuildContext? context,
    required Map<String, dynamic> header,
    bool? showLogs,
    bool? showLoader,
    bool? showSnackbar,
  }) async {
    if (showLoader ?? true) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        showLoading();
      });
    }
    if (showLogs ?? true) {
      log("Request url-- $baseUrl$url");
      log("Request methode-- ${method.name}");
      log("header-- $header");
      log("logs-- $showLogs");
      if (payload is FormData) {
        log("Request Body FormData -- ${payload.fields} ${payload.files}");
      } else {
        log("Request Body-- $payload");
      }
    }
    try {
      Response<dynamic> response;
      switch (method) {
        case RequestMethod.get:
          response = await api.get(
            url,
            data: payload,
            options: Options(headers: header),
          );
          break;
        case RequestMethod.post:
          response = await api.post(
            url,
            data: payload,
            options: Options(headers: header),
          );
          break;
        case RequestMethod.patch:
          response = await api.patch(
            url,
            data: payload,
            options: Options(headers: header),
          );
          break;
        case RequestMethod.delete:
          response = await api.delete(url, options: Options(headers: header));
          break;
      }
      if (showLoader ?? true) {
        await RoutingService().goBack();
      }

      if (response.data["status_code"] == 200 ||
          response.data["status_code"] == 201) {
        if (showSnackbar ?? true && response.data["message"] != null) {
          SnackBarData.topShowSnackBar(
            response.data["message"].toString(),
            Colors.black,
          );
        }
        return response.data["data"];
      }
      return null;
    } on DioException catch (e) {
      if (showLoader ?? true) {
        await RoutingService().goBack();
      }
      if (e.type == DioExceptionType.connectionError) {
        SnackBarData.topShowSnackBar(
          'Check Your Internet Connection',
          Colors.redAccent,
        );
      } else {
        log("message${e.message.toString()}");
        SnackBarData.topShowSnackBar(
          'Server error :- ${e.message.toString()}',
          Colors.redAccent,
        );
      }
    }
  }
}

enum RequestMethod { get, post, patch, delete }
