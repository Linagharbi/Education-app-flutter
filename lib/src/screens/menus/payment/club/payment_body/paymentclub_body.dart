import 'dart:developer';

import 'package:education_app/src/models/tranche/payment_extra_tranche.dart';
import 'package:education_app/src/models/tranche/tranche.dart';
import 'package:education_app/src/providers/children.dart';
import 'package:education_app/src/screens/menus/payment/club/details/detailsclub_screen.dart';
import 'package:education_app/src/screens/menus/payment/club/payment_body/club_card.dart';
import 'package:education_app/src/screens/menus/payment/dropdown_payment.dart';
import 'package:education_app/src/services/http_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PaymentClubBody extends StatelessWidget {
  final HttpService _httpService = HttpService();

  Widget _buildListView(Children children) {
    if (children.selectedStudent.idClub == null) {
      return Text("No club payments!");
    }

    log("ClubBody: Building the list view for ${children.selectedStudent.idClub}");
    // Check if idClub != null
    Future<List<PaymentExtraTranche>> _futureExtraTranches =
        _httpService.getExtraTranches(children.selectedStudent.idClub);
    return FutureBuilder(
      future: _futureExtraTranches,
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.hasData) {
          List<PaymentExtraTranche> myTranches = snapshot.data;
          return ListView.builder(
            // here we use our demo tranches list
            itemCount: myTranches.length,
            itemBuilder: (context, index) => ClubCard(
              itemIndex: index,
              tranche: myTranches[index],
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailsClubScreen(
                      tranche: tranches[0],
                    ),
                  ),
                );
              },
            ),
          );
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

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
                Consumer<Children>(
                  builder: (context, children, child) =>
                      _buildListView(children),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
