import 'package:flutter/material.dart';

class GradesAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double _preferredHeight = 130;

  final String title;
  final Color gradientBegin, gradientEnd;

  GradesAppBar({this.title, this.gradientBegin, this.gradientEnd})
      : assert(title != null),
        assert(gradientBegin != null),
        assert(gradientEnd != null);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: _preferredHeight,
      alignment: Alignment.center,
      padding: EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black54,
            blurRadius: 15,
            offset: Offset(0, 0.75),
          ),
        ],
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: <Color>[gradientBegin, gradientEnd],
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
              letterSpacing: 1,
              fontSize: 28,
              fontWeight: FontWeight.w700,
            ),
          ),
          // To keep the text centered
          IconButton(
            disabledColor: Colors.transparent,
            icon: Icon(Icons.arrow_back_ios),
            onPressed: null,
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(_preferredHeight);
}
