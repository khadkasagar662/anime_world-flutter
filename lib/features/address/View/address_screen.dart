import 'package:flutter/material.dart';
import 'package:khalti_flutter/khalti_flutter.dart';
// import 'package:khalti_flutter/khalti_flutter.dart';
import 'package:pay/pay.dart';
import 'package:provider/provider.dart';

import '../../../common/custom_textform_field.dart';
import '../../../constants/global_variable.dart';
import '../../../constants/utils.dart';
import '../../../esewapay.dart';
// import '../../../payment_configurations.dart';
import '../../../provider/user_provider.dart';
import '../ViewModel/address_services.dart';

class AddressScreen extends StatefulWidget {
  static const String routeName = '/address';
  final String totalAmount;
  const AddressScreen({
    Key? key,
    required this.totalAmount,
  }) : super(key: key);

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  final TextEditingController flatBuildingController = TextEditingController();
  final TextEditingController areaController = TextEditingController();
  final TextEditingController pincodeController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final _addressFormKey = GlobalKey<FormState>();

  String addressToBeUsed = "";
  List<PaymentItem> paymentItems = [];
  final AddressServices addressServices = AddressServices();

  @override
  void initState() {
    super.initState();
    paymentItems.add(
      PaymentItem(
        amount: widget.totalAmount,
        label: 'Total Amount',
        status: PaymentItemStatus.final_price,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    flatBuildingController.dispose();
    areaController.dispose();
    pincodeController.dispose();
    cityController.dispose();
  }

  void onApplePayResult(res) {
    if (Provider.of<UserProvider>(context, listen: false)
        .user
        .address
        .isEmpty) {
      addressServices.saveUserAddress(
          context: context, address: addressToBeUsed);
    }
    addressServices.placeOrder(
      context: context,
      address: addressToBeUsed,
      totalSum: double.parse(widget.totalAmount),
    );
  }

  void onGooglePayResult(res) {
    if (Provider.of<UserProvider>(context, listen: false)
        .user
        .address
        .isEmpty) {
      addressServices.saveUserAddress(
          context: context, address: addressToBeUsed);
    }
    addressServices.placeOrder(
      context: context,
      address: addressToBeUsed,
      totalSum: double.parse(widget.totalAmount),
    );
  }

  void payPressed(String addressFromProvider) {
    addressToBeUsed = "";

    bool isForm = flatBuildingController.text.isNotEmpty ||
        areaController.text.isNotEmpty ||
        pincodeController.text.isNotEmpty ||
        cityController.text.isNotEmpty;

    if (isForm) {
      if (_addressFormKey.currentState!.validate()) {
        addressToBeUsed =
            '${flatBuildingController.text}, ${areaController.text}, ${cityController.text} - ${pincodeController.text}';
      } else {
        throw Exception('Please enter all the values!');
      }
    } else if (addressFromProvider.isNotEmpty) {
      addressToBeUsed = addressFromProvider;
    } else {
      showSnackBar(context, 'ERROR');
    }
  }

  //   void onEsewaPaymentSuccess(EsewaPaymentSuccessResult result) {
  //   debugPrint('eSewa Payment Success');
  //   addressServices.placeOrder(
  //      context: context,
  //     address: addressToBeUsed,
  //     totalSum: double.parse(widget.totalAmount),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    var address = context.watch<UserProvider>().user.address;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: GlobalVariables.appBarGradient,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              if (address.isNotEmpty)
                Column(
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black12,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          address,
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'OR',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              Form(
                key: _addressFormKey,
                child: Column(
                  children: [
                    CustomTextField(
                      controller: flatBuildingController,
                      hintText: 'Flat, House no, Building',
                    ),
                    const SizedBox(height: 10),
                    CustomTextField(
                      controller: areaController,
                      hintText: 'Area, Street',
                    ),
                    const SizedBox(height: 10),
                    CustomTextField(
                      controller: pincodeController,
                      hintText: 'Pincode',
                    ),
                    const SizedBox(height: 10),
                    CustomTextField(
                      controller: cityController,
                      hintText: 'Town/City',
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              // GestureDetector(
              //   onTap: () => payPressed(address),
              //   child: Container(
              //     width: double.infinity,
              //     margin: const EdgeInsets.only(top: 15.0),
              //     child: GooglePayButton(
              //       paymentConfiguration:
              //           PaymentConfiguration.fromJsonString(defaultGooglePay),
              //       onPaymentResult: onGooglePayResult,
              //       paymentItems: paymentItems,
              //       height: 50,
              //       width: double.infinity,
              //       type: GooglePayButtonType.buy,
              //       loadingIndicator: const Center(
              //         child: CircularProgressIndicator(),
              //       ),
              //     ),
              //   ),
              // ),
             
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Esewa esewa = Esewa();
                  esewa.pay(context);
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 81, 217, 115),
                    minimumSize: const Size(double.infinity, 50)),
                child: const Text(
                  " Pay with E-sewa",
                  style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ),
               const SizedBox(height: 20),
              const Text(
                'OR',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 51, 30, 213),
                    minimumSize: const Size(double.infinity, 50)),
                onPressed: () {
                  KhaltiScope.of(context).pay(
                    config: PaymentConfig(
                        amount:
                            (double.parse(widget.totalAmount) * 100).toInt(),
                        productIdentity: '64b9678b0391bd66dab0334f',
                        productName: 'Mix anime T-shirt'),
                    preferences: [PaymentPreference.khalti],
                    onSuccess: (su) {
                      const sucesssnackbar = SnackBar(
                        content: Text(" payment successful"),
                      );
                      ScaffoldMessenger.of(context)
                          .showSnackBar(sucesssnackbar);
                    },
                    onFailure: (fa) {
                      const failsnackbar = SnackBar(
                        content: Text(" payment failed"),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(failsnackbar);
                    },
                  );
                },
                child: const Text(
                  "Pay with khalti",
                  style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
