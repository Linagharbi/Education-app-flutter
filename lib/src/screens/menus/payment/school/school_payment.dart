import 'package:education_app/src/screens/menus/payment/school/payment_body/paymentschool_body.dart';
import 'package:flutter/material.dart';

class SchoolPayment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      backgroundColor: Color(0xFF035AA6),
      body: PaymentSchoolBody(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      centerTitle: true,
      backgroundColor: Colors.transparent,
      title: Text('Scolaire'),
    );
  }
}
