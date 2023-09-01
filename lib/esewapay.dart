
import 'package:assignmentfinal/constants/esewa.dart';
import 'package:esewa_flutter_sdk/esewa_config.dart';
import 'package:esewa_flutter_sdk/esewa_flutter_sdk.dart';
import 'package:esewa_flutter_sdk/esewa_payment.dart';
import 'package:esewa_flutter_sdk/esewa_payment_success_result.dart';
import 'package:flutter/material.dart';
class Esewa {
  pay(BuildContext context) {
    try {
      EsewaFlutterSdk.initPayment(
        esewaConfig: EsewaConfig(
          environment: Environment.test,
          clientId: kEsewaClientId,
          secretId: kEsewaSecretId,
        ),
        esewaPayment: EsewaPayment(
            productId: '64b9678b0391bd66dab0334f',
            productName: 'Mix anime T-shirt',
            productPrice: "120"),
        onPaymentSuccess: (EsewaPaymentSuccessResult result) {
          debugPrint('SUCCESS');
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Payment Successful!'),
              backgroundColor: Colors.green,
            ),
          );
          verify(result);
        },
        onPaymentFailure: () {
          debugPrint('Failure');
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Payment Failed!'),
              backgroundColor: Colors.red,
            ),
          );
        },
        onPaymentCancellation: () {
          debugPrint('Cancelled');
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Payment Cancelled.'),
              backgroundColor: Colors.yellow,
            ),
          );
        },
      );
    } catch (e) {
      debugPrint('Exception');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('An error occurred.'),
          backgroundColor: Colors.red,
        ),
      );
      
    }
  }
   verify(EsewaPaymentSuccessResult result){
    //TODO: after success call this function to verify transaction
  }
}
