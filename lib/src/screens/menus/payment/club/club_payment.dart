import 'package:education_app/src/screens/menus/payment/club/payment_body/paymentclub_body.dart';
import 'package:education_app/src/screens/menus/payment/dropdownlist.dart';
import 'package:flutter/material.dart';

class ClubPayment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      backgroundColor: Color(0xFF035AA6),
      body: PaymentClubBody(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      centerTitle: true,
      backgroundColor: Colors.transparent,
      title: Text('Club'),
      actions: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: 53),
          child: DropDownList(),
        )
      ],
    );
  }
}
