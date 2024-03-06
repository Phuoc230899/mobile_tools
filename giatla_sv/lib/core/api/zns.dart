import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ZNSService {
  static String token_zns =
      "LoMGQfJf4WVMvD7gr2WJnbMbqkdH_qrI1VDPe5ckH5I3i9EhKBnGcegk1QsL8r4GZIr4wvAsqPl1fqmZ4_iObiZYWcdIyq3HXhqMerMlHLfNFjwg1Ej8MLL_bUl48KYHHhkBfi8e4jnSf8Dm0ZK1ZnEatpN6yeJCr6TPEOCn14YGwXEraMTA3impMFIGvej5pdVGzKhgoyoG_bmZ4k2E5K5wMU3LznlCnhk5_mKfLaYNf8Jb1V9RbeTd6NiPEizDJc6SOj4i3zbFlnIpdNADmmIX7l26lKK7LUd6kfPb64sN_WP-nYiQKH_vWIfSOzzJ1xd2FWJgKKQIyyTy064IX96n32cIOPxKYJq8eGZcKvpI_KhdI2ENMXUum2y2DO4NNZZQ-a4f6uhQSHdsmRy0XHBp6QdH8GCM5c6Fm4yhqsaIm";

  static String refreshUrlZNS = "https://oauth.zaloapp.com/v4/oa/access_token";

  static String urlSendZNS =
      "https://business.openapi.zalo.me/message/template";

  Future<String?> getAppId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('appId');
  }

  // Future<String?> setfirst() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   await prefs.setString('token_zns', token_zns);
  // }

  Future<String?> getSecretKey() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('secretKey');
  }

  Future<String?> getTemplateId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('templateId');
  }

  Future<String?> getTokenZNS() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('token_zns');
  }

  static String generateTrackingId() {
    final random = Random();
    final allowedCharacters =
        'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    final trackingId = List.generate(
        48,
        (index) =>
            allowedCharacters[random.nextInt(allowedCharacters.length)]).join();

    return trackingId;
  }

  Future<bool> sendZNS(name, phone_number, orderCode, date, price) async {
    print("send zalo");

    String? phone = phone_number.toString().replaceFirst(RegExp(r"^0"), "84");
    String? token_zns = await getTokenZNS();
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "access_token": token_zns ?? ''
    };
    String? templateId = await getTemplateId();
    String? appId = await getAppId();
    String? secretKey = await getSecretKey();

    String trackingId = generateTrackingId();

    Map<String, dynamic> payload = {
      "phone": phone,
      "template_id": templateId ?? '',
      "template_data": {
        "order_code": orderCode,
        "date": date,
        "price": price,
        "name": name
      },
      "tracking_id": trackingId
    };

    String jsonString = json.encode(payload);
    final response = await http.post(Uri.parse(urlSendZNS),
        headers: headers, body: jsonString);
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      if (jsonResponse != null && jsonResponse['error'] == 0) {
        return true;
      } else if (jsonResponse != null && jsonResponse['error'] == -118) {
        throw Exception("-118 So dth khong su dung zalo");
      } else if (jsonResponse != null && jsonResponse['error'] == -124) {
        if (await refreshTokenZNS()) {
          return sendZNS(name, phone_number, orderCode, date, price);
        } else {
          throw Exception("401 not auth");
        }
      }
    }
    return true;
  }

  Future<String?> getRefreshTokenZNS() async {
    // Lấy token từ local storage
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('refreshTokenZNS');
  }

  Future<bool> refreshTokenZNS() async {
    print("refresh token zalo");

    String? refreshTokenZNS = await getRefreshTokenZNS();
    String? secretKey = await getSecretKey();
    String? appId = await getAppId();

    Map<String, String> headers = {
      "Content-Type": "application/x-www-form-urlencoded",
      "secret_key": secretKey ?? '',
    };
    Map<String, String> payload = {
      "refresh_token": refreshTokenZNS ?? '',
      "app_id": appId ?? '',
      "grant_type": "refresh_token"
    };

    // String jsonString = json.encode(payload);

    final response = await http.post(Uri.parse(refreshUrlZNS),
        headers: headers, body: payload);

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      String accessToken = jsonResponse['access_token'];
      String refreshToken = jsonResponse['refresh_token'];
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('token_zns', accessToken);
      await prefs.setString('refreshTokenZNS', refreshToken);
      return true;
    } else {
      return false;
    }
  }
}
