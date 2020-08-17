import 'package:flutter/material.dart';

class DelayDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.fromLTRB(20, 20, 20, 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(100),
            blurRadius: 10.0,
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 5),
              child: Text(
                "Problème de transport",
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 20,
                top: 10,
                bottom: 10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(bottom: 3),
                    child: Text("8:15  |  Durée: 15 minutes"),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 3),
                    child: Text("Français"),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 3),
                    child: Text("Mohsen Trabelsi"),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 3),
                    child: Text("17 August 2020"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
