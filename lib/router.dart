import 'package:assignmentfinal/common/bottom_bar.dart';
import 'package:assignmentfinal/features/address/View/address_screen.dart';
import 'package:assignmentfinal/features/admin/View/add_product.dart';
import 'package:assignmentfinal/features/auth/View/auth_screen.dart';
import 'package:assignmentfinal/features/home/View/categories_screen.dart';
import 'package:assignmentfinal/features/home/View/home_screen.dart';
import 'package:assignmentfinal/features/order/screen/order_details.dart';
import 'package:flutter/material.dart';

import 'features/account/model/order.dart';
import 'features/product_details/model/product.dart';
import 'features/product_details/View/product_detail_screen.dart';
import 'features/search/View/search_screen.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case AuthScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const AuthScreen(),
      );
    case HomeScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const HomeScreen(),
      );
    case BottomBar.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const BottomBar(),
      );
    case AddProductScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const AddProductScreen(),
      );
    case CategoryScreen.routeName:
      var category = routeSettings.arguments as String;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => CategoryScreen(category: category),
      );
    case SearchScreen.routeName:
     var searchQuery = routeSettings.arguments as String;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => SearchScreen(
          searchQuery: searchQuery,
        ),
      );  
    case ProductDetailScreen.routeName:
     var product = routeSettings.arguments as Product;
      return MaterialPageRoute(
      settings: routeSettings,  
        builder: (_) => ProductDetailScreen(
          product: product,
        ),
      );  
    case AddressScreen.routeName:
    var totalAmount = routeSettings.arguments as String;
      return MaterialPageRoute(
      settings: routeSettings,  
        builder: (_) =>   AddressScreen(
          totalAmount: totalAmount,
        ),
      );  
    case OrderDetailScreen.routeName:
    var order = routeSettings.arguments as Order;
      return MaterialPageRoute(
      settings: routeSettings,  
        builder: (_) =>   OrderDetailScreen(
          order:order,
        ),
      );  
    default:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const Scaffold(
          body: Center(
            child: Text("screen doesnot exist"),
          ),
        ),
      );
  }
}
