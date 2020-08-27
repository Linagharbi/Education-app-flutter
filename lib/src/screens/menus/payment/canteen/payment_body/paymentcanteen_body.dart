import 'package:education_app/src/models/tranche.dart';
import 'package:education_app/src/screens/menus/payment/canteen/details/detailscanteen_screen.dart';
import 'package:education_app/src/screens/menus/payment/canteen/payment_body/canteen_card.dart';
import 'package:education_app/src/screens/menus/payment/dropdown_payment.dart';
import 'package:flutter/material.dart';

class PaymentCanteenBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Column(
        children: <Widget>[
          SizedBox(height: 5),
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Align(
              alignment: Alignment.centerRight,
              child: DropDownPayment(),
            ),
          ),
          Expanded(
            child: Stack(
              children: <Widget>[
                // Our background
                Container(
                  margin: EdgeInsets.only(top: 70),
                  decoration: BoxDecoration(
                    color: Color(0xFFF1EFF1),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    ),
                  ),
                ),
                ListView.builder(
                  // here we use our demo tranches list
                  itemCount: tranches.length,
                  itemBuilder: (context, index) => CanteenCard(
                    itemIndex: index,
                    tranche: tranches[index],
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailsCanteenScreen(
                            tranche: tranches[index],
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
