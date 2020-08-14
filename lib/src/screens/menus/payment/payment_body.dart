import 'package:flutter/material.dart';

class PaymentBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return Container(
    //   color: Colors.red[900],
    //   child: SafeArea(
    //     child: Scaffold(
    //       body: Center(
    //         child: Text(
    //           "Your Payments",
    //           style: TextStyle(fontWeight: FontWeight.w900, fontSize: 28),
    //         ),
    //       ),
    //     ),
    //   ),
    // );
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Payments",
          style: TextStyle(fontSize: 25),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          "Your Payments",
          style: TextStyle(fontWeight: FontWeight.w900, fontSize: 28),
        ),
      ),
    );
  }
}
