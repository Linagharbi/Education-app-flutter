import 'dart:developer';

import 'package:education_app/src/models/tranche/inscriptionTranche.dart';
import 'package:education_app/src/models/tranche/tranche.dart';
import 'package:education_app/src/providers/children.dart';
import 'package:education_app/src/screens/menus/payment/dropdown_payment.dart';
import 'package:education_app/src/screens/menus/payment/school/details/detailsschool_screen.dart';
import 'package:education_app/src/screens/menus/payment/school/payment_body/school_card.dart';
import 'package:education_app/src/services/http_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PaymentSchoolBody extends StatelessWidget {
  final HttpService _httpService = HttpService();

  Widget _buildListView(Children children) {
    log("SchoolBody: Building the lisView for ${children.selectedStudent.inscriptionEleve.id}");
    Future<List<InscriptionTranche>> _futureTranches =
        _httpService.getTranches(children.selectedStudent.inscriptionEleve.id);
    return FutureBuilder(
      future: _futureTranches,
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.hasData) {
          List<InscriptionTranche> myTranches = snapshot.data;
          return ListView.builder(
            // here we use our demo tranches list
            itemCount: myTranches.length,
            itemBuilder: (context, index) => SchoolCard(
              itemIndex: index,
              tranche: myTranches[index],
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
                // Only rebuild this widget on selectedStudent change (from dropdownlist)
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
