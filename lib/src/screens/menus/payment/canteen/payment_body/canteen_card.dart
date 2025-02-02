import 'package:education_app/src/models/payment/tranche/payment_extra_tranche.dart';
import 'package:flutter/material.dart';

class CanteenCard extends StatelessWidget {
  const CanteenCard({
    Key key,
    this.itemIndex,
    this.tranche,
    this.press,
  }) : super(key: key);

  final int itemIndex;
  final PaymentExtraTranche tranche;
  final Function press;

  @override
  Widget build(BuildContext context) {
    // It  will provide us total height and width of our screen
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 20.0 / 2,
      ),
      // color: Colors.blueAccent,
      height: 140,
      child: InkWell(
        onTap: press,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            // Those are our background
            Container(
              height: 132,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(21),
                color: itemIndex.isEven ? Color(0xFF40BAD5) : Color(0xFFFFA41B),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 15),
                    blurRadius: 27,
                    color: Colors.black12, // Black color with 12% opacity
                  )
                ],
              ),
              child: Container(
                margin: EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(22),
                ),
              ),
            ),
            // our product image
            Positioned(
              top: 25,
              right: 25,
              child: Hero(
                tag: '${tranche.id}',
                child: Container(
                  // padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                  height: 50,
                  // image is square but we add extra 20 + 20 padding thats why width is 200
                  width: 50,
                  child: Image.asset(
                    "assets/images/cheque.png",
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            // Product title and price
            Positioned(
              bottom: 0,
              left: 0,
              child: SizedBox(
                height: 136,
                // our image take 200 width, thats why we set out total width - 200
                width: size.width - 200,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text(
                        tranche.motif.toString(),
                        style: Theme.of(context).textTheme.button,
                      ),
                    ),
                    Spacer(),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text(
                        tranche.tauxTva.toString(),
                        style: Theme.of(context).textTheme.button,
                      ),
                    ),
                    // it use the available space
                    Spacer(),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.0 * 1.5, // 30 padding
                        vertical: 20.0 / 4, // 5 top and bottom
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xFFFFA41B),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(22),
                          topRight: Radius.circular(22),
                        ),
                      ),
                      child: Text(
                        "${tranche.totalTtc}\ dinars",
                        style: Theme.of(context).textTheme.button,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
