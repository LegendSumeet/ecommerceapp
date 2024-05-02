import 'package:ecommerceapp/models/COllection.dart';
import 'package:ecommerceapp/models/GetOrders.dart';
import 'package:ecommerceapp/models/Product.dart';
import 'package:ecommerceapp/models/Products.dart';
import 'package:ecommerceapp/models/send.dart';
import 'package:ecommerceapp/repo/DBHelper.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as https;

class ProductDatabaseHelper extends ChangeNotifier {
  late Future<List<Products>> products;
  late Future<Product> product;
  late Future<List<GetOrders>> orders;

  Future<List<Products>> getProducts() async {
    products = DBHelper.getProductsbyuser();
    return products;
  }

  Future<Product> getProductById(String id) async {
    product = DBHelper.getProductsbyid(id);
    return product;
  }

  Customer usermodel = Customer(clerkId: '', email: '', name: '');

  Future<bool> proceedToCheckout(List<String> ids) async {
    List<CartItem> userCartmodel = [];
    for (var id in ids) {
      Product product = await getProductById(id);
      userCartmodel.add(CartItem(
        item: Item(
          id: product.id,
          price: product.price,
          description: product.description,
          category: product.category,
          createdAt: product.createdAt,
          updatedAt: product.updatedAt,
          v: product.v,
          title: product.title,
          media: product.media,
          collections: [],
          tags: product.tags,
          sizes: product.sizes,
          colors: product.colors,
          expense: product.expense,
          itemId: product.id,
        ),
        quantity: 1,
      ));
    }
    PlaceOrder model =
        PlaceOrder(cartItems: userCartmodel, customer: usermodel);
    return DBHelper.proccedtocheckout(model);
  }

  Future<List<GetOrders>> getOrders(String id) async {
    orders = DBHelper.getorders(id);
    return orders;
  }

  Future<GetOrders> getOrdersforuser(String id) async {
    Future<List<GetOrders>> ordersa = orders;
    print('Orders: $ordersa');
    Future<GetOrders> order = ordersa.then((value) {
      for (var order in value) {
        if (order.id == id) {
          return order;
        }
      }
      return "No Order Found" as Future<GetOrders>;
    });

    return order;
  }

  Future<List<String>> getOrdersforuser1(String id) async {
    List<GetOrders> orders = await getOrders(id);
    List<String> orderids = [];
    for (var order in orders) {
      orderids.add(order.id);
    }
    return orderids;
  }
}

class UserDatabaseHelper extends ChangeNotifier {}
