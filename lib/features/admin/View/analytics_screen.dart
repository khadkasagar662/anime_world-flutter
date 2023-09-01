import 'package:assignmentfinal/common/loading.dart';
import 'package:assignmentfinal/features/admin/widgets/category_products.dart';
import 'package:flutter/material.dart';

import '../model/sales.dart';
import '../Viewmodel/admin_services.dart';

class AnalyticsScreen extends StatefulWidget {
  const AnalyticsScreen({super.key});

  @override
  State<AnalyticsScreen> createState() => _AnalyticsScreenState();
}

class _AnalyticsScreenState extends State<AnalyticsScreen> {
  final AdminServices adminServices = AdminServices();
  int? totalSales;
  List<Sales>? earnings;

  @override
  void initState() {
    super.initState();
    getEarnings();
  }

  getEarnings() async {
    var earningData = await adminServices.getEarnings(context);
    totalSales = earningData['totalEarnings'];
    earnings = earningData['sales'];
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return earnings == null || totalSales == null
        ? const Loader()
        : Column(children: [
            Text(
              '\$$totalSales',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            CategoryProducts(salesData: [
              for (var sale in earnings!) Sales(sale.label, sale.earning)
            ]),
          ]);
  }
}
