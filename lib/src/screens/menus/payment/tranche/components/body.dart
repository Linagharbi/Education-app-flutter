import 'package:education_app/src/models/tranche.dart';
import 'package:education_app/src/screens/menus/payment/datails/details_screen.dart';
import 'package:flutter/material.dart';

import 'category_list.dart';
import 'tranche_card.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Column(
        children: <Widget>[
          // SearchBox(onChanged: (value) {}),
          CategoryList(),
          SizedBox(height: 20.0 / 8),
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
                  itemBuilder: (context, index) => ProductCard(
                    itemIndex: index,
                    tranche: tranches[index],
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailsScreen(
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
