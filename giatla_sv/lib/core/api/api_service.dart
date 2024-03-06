import 'dart:math';

import 'package:giatla_sv/screens/transaction/model/oder.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class APIService {
  Future<String?> getToken() async {
    // Lấy token từ local storage
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  Future<String?> getRefreshToken() async {
    // Lấy token từ local storage
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('refresh_token');
  }

  Future<String?> getShopId() async {
    // Lấy token từ local storage
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('shopId');
  }

  Future<void> setToken() async {
    final prefs = await SharedPreferences.getInstance();
    String token =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJjcmVhdGVkQXQiOjE3MDk1NTk1NTQ2ODMsInVzZXJJZCI6ImY2NDhlZDlkLTg0OWMtNTgxMC1hY2ViLTM4ZWVlNTcyMWJiOCIsInBob25lIjoiMDkwOTMyNDgzOCIsImVtcGxveWVlSWQiOiJmNjQ4ZWQ5ZC04NDljLTU4MTAtYWNlYi0zOGVlZTU3MjFiYjgiLCJyb2xlcyI6W3sic2hvcElkIjoiNTdjMjg0ZDMtNjA3My00ZjRhLThjYjMtYWFhMWQwYmExNTA4Iiwicm9sZXMiOnsib25seU1lIjpmYWxzZSwiYXJyYXkiOlsiY2FzaGJvb2subGlzdCIsImNhc2hib29rLmNyZWF0ZSIsImNhc2hib29rLnVwZGF0ZSIsImNhc2hib29rLmRlbGV0ZSIsInBheWJvb2subGlzdCIsInBheWJvb2suY3JlYXRlIiwicGF5Ym9vay51cGRhdGUiLCJwYXlib29rLmRlbGV0ZSIsInByb2R1Y3QubGlzdCIsInByb2R1Y3QuY3JlYXRlIiwicHJvZHVjdC51cGRhdGUiLCJwcm9kdWN0LmRlbGV0ZSIsInByb2R1Y3QucHJpY2VJbXBvcnQiLCJwcm9kdWN0LnByaWNlQ29zdCIsInByb2R1Y3QuaW52ZW50b3J5Iiwid2FyZWhvdXNlLnZpZXciLCJ3YXJlaG91c2UuaW1wb3J0Iiwid2FyZWhvdXNlLmV4cG9ydCIsIndhcmVob3VzZS5oaXN0b3J5IiwiY29udGFjdC5saXN0Q3VzdG9tZXIiLCJjb250YWN0Lmxpc3RQcm92aWRlciIsImNvbnRhY3QuY3JlYXRlIiwiY29udGFjdC51cGRhdGUiLCJjb250YWN0LnBob25lIiwiY29udGFjdC5kZWJ0IiwiY29udGFjdC50b3RhbE1vbmV5IiwiY29udGFjdC50b3RhbE9yZGVyIiwic2FsZS5saXN0Iiwic2FsZS5jcmVhdGUiLCJzYWxlLmNhbmNlbCIsInNhbGUudXBkYXRlIiwic2FsZS51cGRhdGVTdGF0dXMiLCJzYWxlLmNoYW5nZUVtcGxveWVlIiwicmVwb3J0LnByb2ZpdExvc3MiLCJyZXBvcnQuc2hvcCIsInJlcG9ydC53YXJlaG91c2UiLCJyZXBvcnQuY2FzaGJvb2siLCJyZXBvcnQucHJvZml0U2FsZSIsInNldHRpbmcudmlldyIsInNldHRpbmcuZWRpdEZlZUNsYXNzaWZpZXMiLCJzZXR0aW5nLmVkaXRJbmNvbWVDbGFzc2lmaWVzIiwic2V0dGluZy5lZGl0VHlwZXNPZk1vbmV5Iiwic2V0dGluZy5lZGl0UHJvZHVjdENhdGVnb3JpZXMiLCJzZXR0aW5nLmVkaXRJbXBvcnRDbGFzc2lmaWVzIiwic2V0dGluZy5lZGl0RXhwb3J0Q2xhc3NpZmllcyIsInNldHRpbmcuZWRpdEV4dHJhQ2xhc3NpZmllc0luY29tZSIsInNldHRpbmcuZWRpdEV4dHJhQ2xhc3NpZmllc0ZlZSIsInNldHRpbmcuZWRpdFNldHRpbmdJbmZvIiwic2V0dGluZy5lZGl0V2Vic2l0ZUluZm8iLCJzZXR0aW5nLmVkaXRCYW5rSW5mbyIsInNldHRpbmcuZWRpdFNoaXBwaW5nIiwic3VwcGVyLm1hbmFnZVNob3AiLCJzaGlmdC5jcmVhdGUiLCJzaGlmdC5tYW5hZ2VPdGhlciJdfX1dLCJzaG9wSWRzIjpbIjU3YzI4NGQzLTYwNzMtNGY0YS04Y2IzLWFhYTFkMGJhMTUwOCJdLCJpYXQiOjE3MDk1NTk1NTQsImV4cCI6MTcwOTU2MzE1OX0.g4LazfKcYzQRKJNDpT24ahSVf2ijFPdwbwd-6a4V2qk';
    await prefs.setString('token', token);
    String refresh_token =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2NzgxZWMxOC03OGQ5LTU0ZTItYmVkMC1iMjA1YjViYmNhZDAiLCJpYXQiOjE3MDk1NDIxNDksImV4cCI6MTcxMjEzNDE0OX0.wUnYGIxqaIXZkH85PhS1UxJf94t8vsmBzfH8UxActY0';
    await prefs.setString('refresh_token', refresh_token);
  }

  static const String orderUrl =
      "https://api.afada.vn/sellOrder/listV34?page=1&sortBy=time&sortType=DESC&statusOfOrder=2&subStatus=0";

  static const String loginUrl = "https://api.afada.vn/auth/login";
  static const String refreshUrl = "https://api.afada.vn/auth/freshToken";
  static const String updateStatusUrl =
      "https://api.afada.vn/sellOrder/updateStatus";

  Future<List<Order>> fetchData() async {
    print("fetch data");
    String? token = await getToken();
    String? shopId = await getShopId();

    List<Order> orders = [];
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Token': token ?? "",
      'ShopId': shopId ?? "",
      'User-agent':
          'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36'
    };
    final response = await http.get(Uri.parse(orderUrl), headers: headers);
    if (response.statusCode == 200) {
      // return json.decode(response.body);

      final jsonResponse = json.decode(response.body);
      String? error = jsonResponse['error'];
      if (error != null && error == "not auth") {
        await refreshToken();
        return fetchData();
      }
      for (var item in jsonResponse['orders']) {
        orders.add(Order.fromJson(item));
      }
      return orders;
    } else {
      throw Exception('Failed to load data from $orderUrl');
    }
  }

  Future<void> login() async {
    print("login");
    Map<String, dynamic> payload = {
      'phone': '0909324838',
      'password': 'Onghung123',
    };
    String jsonString = json.encode(payload);

    var time = DateFormat("yyyy-MM-dd'T'HH:mm:ss")
        .format(DateTime.now().toUtc().add(Duration(hours: 7)));
    Map<String, String> headers = {
      'authority': 'api.afada.vn',
      'accept': 'application/json',
      'accept-language': 'en-GB,en;q=0.9',
      'clienttimestamp': time,
      'content-type': 'application/json',
      'origin': 'https://app.afada.vn',
      'platform': 'web',
      'referer': 'https://app.afada.vn/',
      'sec-ch-ua': '"Chromium";v="122", "Not(A:Brand";v="24", "Brave";v="122"',
      'sec-ch-ua-mobile': '?0',
      'sec-ch-ua-platform': '"Windows"',
      'sec-fetch-dest': 'empty',
      'sec-fetch-mode': 'cors',
      'sec-fetch-site': 'same-site',
      'sec-gpc': '1',
      'user-agent':
          'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36'
    };
    final response = await http.post(Uri.parse(loginUrl),
        headers: headers, body: jsonString);

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      String? token = jsonResponse['token'];
      String? refreshToken = jsonResponse['freshToken'];
      String? shopId = jsonResponse['shopId'];

      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', token!);
      await prefs.setString('refresh_token', refreshToken!);
      await prefs.setString('refresh_token', shopId!);
    } else {
      throw Exception('Failed to load data from $orderUrl');
    }
  }

  Future<bool> refreshToken() async {
    print("refresh");
    String? refresh_token = await getRefreshToken();
    String? shopId = await getShopId();

    var time = DateFormat("yyyy-MM-dd'T'HH:mm:ss")
        .format(DateTime.now().toUtc().add(Duration(hours: 7)));
    Map<String, String> headers = {
      'authority': 'api.afada.vn',
      'accept': 'application/json',
      'accept-language': 'en-GB,en;q=0.9',
      'clienttimestamp': '2024-03-01T00:14:43.338+07:00',
      'content-length': '0',
      'content-type': 'application/json',
      'freshtoken': refresh_token ?? '',
      'origin': 'https://app.afada.vn',
      'platform': 'web',
      'referer': 'https://app.afada.vn/',
      'sec-ch-ua': '"Chromium";v="122", "Not(A:Brand";v="24", "Brave";v="122"',
      'sec-ch-ua-mobile': '?0',
      'sec-ch-ua-platform': '"Windows"',
      'sec-fetch-dest': 'empty',
      'sec-fetch-mode': 'cors',
      'sec-fetch-site': 'same-site',
      'sec-gpc': '1',
      'shopid': shopId ?? '',
      'user-agent':
          'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36'
    };
    final response = await http.post(
      Uri.parse(refreshUrl),
      headers: headers,
    );

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      if (jsonResponse['error'] != null) {
        await login();
        return false;
      }
      String? token = jsonResponse['token'];
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', token!);
      return true;
    } else {
      return false;
      // throw Exception('Failed to load data from $orderUrl');
    }
  }

  Future<bool> updateStatus(orderId) async {
    print("update");
    Map<String, dynamic> payload = {
      "statusOfOrder": 4,
      "orderId": orderId,
      "moneyPay": 0,
      "moneyFromCustomer": 0,
      "typeOfMoneyId": null
    };
    String jsonString = json.encode(payload);
    DateTime now = DateTime.now();
    String isoformat = now.toUtc().toIso8601String();

    Random random = Random();
    double randomNumber = random.nextDouble();

    String txid = '$isoformat@${randomNumber.toStringAsFixed(8)}';

    var time = DateFormat("yyyy-MM-dd'T'HH:mm:ss")
        .format(DateTime.now().toUtc().add(Duration(hours: 7)));
    String? shopId = await getShopId();
    String? token = await getToken();
    Map<String, String> headers = {
      'clienttimestamp': time,
      'content-type': 'application/json',
      'origin': 'https://app.afada.vn',
      'platform': 'web',
      'shopid': shopId ?? '',
      'token': token ?? '',
      'txid': txid,
      'user-agent':
          'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36'
    };
    final response = await http.post(Uri.parse(updateStatusUrl),
        headers: headers, body: jsonString);

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      if (jsonResponse['error'] == 'null') {
        return true;
      } else if (jsonResponse['error'] != null &&
          jsonResponse['error'] == "not auth") {
        await refreshToken();
        return updateStatus(orderId);
      }
      return true;
    } else {
      throw Exception('Failed to load data from $orderUrl');
    }
  }
}
