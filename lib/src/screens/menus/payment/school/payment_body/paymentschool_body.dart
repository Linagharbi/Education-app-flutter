import 'package:education_app/src/models/tranche.dart';
import 'package:education_app/src/screens/menus/payment/dropdownlist.dart';
import 'package:education_app/src/screens/menus/payment/school/details/detailsschool_screen.dart';
import 'package:education_app/src/screens/menus/payment/school/payment_body/school_card.dart';
import 'package:flutter/material.dart';

class PaymentSchoolBody extends StatelessWidget {
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
              child: DropDownList(myContext: context),
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
                  itemBuilder: (context, index) => SchoolCard(
                    itemIndex: index,
                    tranche: tranches[index],
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailsSchoolScreen(
                            tranche: tranches[index],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
