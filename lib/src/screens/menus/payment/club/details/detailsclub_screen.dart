import 'package:education_app/src/models/tranche.dart';
import 'package:education_app/src/screens/menus/payment/club/details/widgets/detailsclub_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DetailsClubScreen extends StatelessWidget {
  final Tranche tranche;

  const DetailsClubScreen({Key key, this.tranche}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF035AA6),
      appBar: buildAppBar(context),
      body: DetailsClubBody(
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
          Navigator.of(context).pop();
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
