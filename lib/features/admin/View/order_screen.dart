import 'package:assignmentfinal/common/loading.dart';
import 'package:assignmentfinal/features/account/widgets/single_product.dart';
import 'package:assignmentfinal/features/admin/Viewmodel/admin_services.dart';
import 'package:assignmentfinal/features/order/screen/order_details.dart';
import 'package:flutter/material.dart';

import '../../account/model/order.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  List<Order>? orders;
  final AdminServices adminServices = AdminServices();

  @override
  void initState() {
    super.initState();
  }

  void fetchOrders() async {
    orders = await adminServices.fetchAllOrders(context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return orders == null
        ? const Loader()
        : GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemCount: orders!.length,
            itemBuilder: (context, index) {
              final orderData = orders![index];
              return GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, OrderDetailScreen.routeName,
                      arguments: orderData);
                },
                child: SizedBox(
                    height: 140,
                    child: SingleProduct(
                      image: orderData.products[0].images[0],
                    )),
              );
            });
  }
}
