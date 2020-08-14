import 'package:flutter/material.dart';

class ItemIcon extends StatelessWidget {
  final int itemId;
  final String label;
  final AssetImage icon;
  final Function changeView;

  ItemIcon({this.label, this.icon, this.changeView, this.itemId});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => changeView(context, itemId: itemId),
      child: Column(
        children: <Widget>[
          Image(
            image: icon,
            fit: BoxFit.contain,
            height: 60,
            width: 60,
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
