import 'package:education_app/src/screens/menus/payment/canteen/payment_body/paymentcanteen_body.dart';
import 'package:flutter/material.dart';

class CanteenPayment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      backgroundColor: Color(0xFF035AA6),
      body: PaymentCanteenBody(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      centerTitle: true,
      backgroundColor: Colors.transparent,
      title: Text('Cantine'),
    );
  }
}
