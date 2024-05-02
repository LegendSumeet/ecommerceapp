import 'dart:convert';

import 'package:ecommerceapp/models/GetOrders.dart';
import 'package:ecommerceapp/models/Product.dart';
import 'package:ecommerceapp/models/Products.dart';
import 'package:ecommerceapp/models/send.dart';
import 'package:ecommerceapp/utils/Config.dart';
import 'package:http/http.dart' as https;

class DBHelper {
  static var client = https.Client();
  static Future<List<Products>> getProductsbyuser() async {
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
    };
    var url = Uri.https(Config.apiUrl, Config.productsUrl);
    var response = await client.get(
      url,
      headers: requestHeaders,
    );
    if (response.statusCode == 200) {
      var requestList = productsFromJson(response.body);
      return requestList;
    } else {
      print(response.body);
      throw Exception('Failed to Product list');
    }
  }

  static Future<Product> getProductsbyid(String id) async {
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
    };
    var url = Uri.https(Config.apiUrl, "${Config.productsUrl}/$id");
    var response = await client.get(
      url,
      headers: requestHeaders,
    );
    if (response.statusCode == 200) {
      var requestList = productFromJson(response.body);
      return requestList;
    } else {
      throw Exception('Failed to load Product');
    }
  }

  static Future<bool> proccedtocheckout(PlaceOrder model) async {
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
    };
    var url = Uri.https(Config.apiUrl, "${Config.orderUrl}");
    var response = await client.post(url,
        headers: requestHeaders, body: jsonEncode(model.toJson()));
    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Failed to load Product');
    }
  }


  static Future<List<GetOrders>> getorders(String id) async {
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
    };
    var url = Uri.https(Config.apiUrl, "${Config.ordersUrl}$id");
    print(url);
    var response = await client.get(url,
        headers: requestHeaders );
    if (response.statusCode == 200) {
      var requestList = getOrdersFromJson(response.body);
      print(requestList);
      print(response.body);
      return requestList;
    } else {
      throw Exception('Failed to load Product');
    }
  }
}
