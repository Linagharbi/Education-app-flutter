import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileListItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool hasNavigation;

  const ProfileListItem({
    Key key,
    this.icon,
    this.text,
    this.hasNavigation = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10.w * 5.5,
      margin: EdgeInsets.symmetric(
        horizontal: 10.w * 4,
      ).copyWith(
        bottom: 10.w * 2,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 10.w * 2,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.w * 3),
        color: Theme.of(context).backgroundColor,
      ),
      child: Row(
        children: <Widget>[
          Icon(
            this.icon,
            size: 10.w * 2.5,
          ),
          SizedBox(width: 10.w * 1.5),
          Text(
            this.text,
            style: TextStyle(
              fontSize: ScreenUtil().setSp(10.w * 1.7),
              fontWeight: FontWeight.w600,
            ).copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
