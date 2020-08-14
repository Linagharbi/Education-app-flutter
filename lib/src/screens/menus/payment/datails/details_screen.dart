import 'package:education_app/src/models/tranche.dart';
import 'package:education_app/src/screens/menus/payment/tranche/tranches_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'components/body.dart';

class DetailsScreen extends StatelessWidget {
  final Tranche tranche;

  const DetailsScreen({Key key, this.tranche}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF035AA6),
      appBar: buildAppBar(context),
      body: Body(
        tranche: tranche,
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xFFF1EFF1),
      elevation: 0,
      leading: IconButton(
        padding: EdgeInsets.only(left: 20.0),
        icon: SvgPicture.asset("assets/icons/back.svg"),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ProductsScreen()));
        },
      ),
      centerTitle: false,
      title: Text(
        'Back'.toUpperCase(),
        style: Theme.of(context).textTheme.bodyText2,
      ),
    );
  }
}
