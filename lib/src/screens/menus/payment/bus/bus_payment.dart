import 'package:education_app/src/screens/menus/payment/bus/payment_body/paymentbus_body.dart';
import 'package:education_app/src/screens/menus/payment/dropdownlist.dart';
import 'package:flutter/material.dart';

class BusPayment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      backgroundColor: Color(0xFF035AA6),
      body: PaymentBusBody(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      centerTitle: true,
      backgroundColor: Colors.transparent,
      title: Text('Bus'),
      actions: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: 53),
          child: DropDownList(),
        )
      ],
    );
  }
}
