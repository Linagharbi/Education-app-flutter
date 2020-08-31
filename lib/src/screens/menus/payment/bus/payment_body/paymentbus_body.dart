import 'package:education_app/src/models/tranche/tranche.dart';
import 'package:education_app/src/screens/menus/payment/bus/details/detailsbus_screen.dart';
import 'package:education_app/src/screens/menus/payment/bus/payment_body/bus_card.dart';
import 'package:education_app/src/screens/menus/payment/dropdown_payment.dart';
import 'package:flutter/material.dart';

class PaymentBusBody extends StatelessWidget {
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
                  itemBuilder: (context, index) => BusCard(
                    itemIndex: index,
                    tranche: tranches[index],
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailsBusScreen(
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
