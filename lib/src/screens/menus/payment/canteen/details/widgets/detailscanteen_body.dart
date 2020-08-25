import 'package:education_app/src/models/tranche.dart';
import 'package:flutter/material.dart';

class DetailsCanteenBody extends StatelessWidget {
  final Tranche tranche;

  const DetailsCanteenBody({Key key, this.tranche}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // it provide us total height and width
    // Size size = MediaQuery.of(context).size;
    // it enable scrolling on small devices
    return SafeArea(
      bottom: false,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              decoration: BoxDecoration(
                color: Color(0xFFF1EFF1),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(60),
                  bottomRight: Radius.circular(60),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0 / 1),
                    child: Text(
                      tranche.title,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                  Text(
                    '${tranche.price}\ dn',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFFFFA41B),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20.0 / 2),
                    child: Text(
                      tranche.description,
                      style: TextStyle(color: Color(0xFF747474)),
                    ),
                  ),
                  SizedBox(height: 20.0),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
