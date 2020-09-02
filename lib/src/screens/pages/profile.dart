import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:education_app/src/screens/bloc_navigation/navigation_bloc.dart';
import 'package:education_app/src/screens/pages/profile_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class ProfilePage extends StatefulWidget with NavigationStates {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, height: 896, width: 414, allowFontScaling: true);

    var profileInfo = Expanded(
      child: Column(
        children: <Widget>[
          Container(
            height: 10.w * 10,
            width: 10.w * 10,
            margin: EdgeInsets.only(top: 10.w * 3),
            child: Stack(
              children: <Widget>[
                CircleAvatar(
                  radius: 10.w * 5,
                  backgroundImage: AssetImage('assets/images/avatar.png'),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    height: 10.w * 2.5,
                    width: 10.w * 2.5,
                    decoration: BoxDecoration(
                      color: Theme.of(context).accentColor,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      heightFactor: 10.w * 1.5,
                      widthFactor: 10.w * 1.5,
                      child: Icon(
                        LineAwesomeIcons.pen,
                        color: Color(0xFF212121),
                        size: ScreenUtil().setSp(10.w * 1.5),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10.w * 2),
          Text(
            'Koussay Aloui',
            style: TextStyle(
              fontSize: ScreenUtil().setSp(10.w * 1.7),
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 10.w * 0.5),
          Text(
            'Koussayaloui@gmail.com',
            style: TextStyle(
              fontSize: ScreenUtil().setSp(10.w * 1.3),
              fontWeight: FontWeight.w100,
            ),
          ),
          SizedBox(height: 10.w * 2),
          Container(
            height: 10.w * 4,
            width: 10.w * 20,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.w * 3),
              color: Theme.of(context).accentColor,
            ),
            child: Center(
              child: Text(
                '9 Class',
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(10.w * 1.5),
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF212121),
                ),
              ),
            ),
          ),
        ],
      ),
    );

    var themeSwitcher = ThemeSwitcher(
      builder: (context) {
        return AnimatedCrossFade(
          duration: Duration(milliseconds: 200),
          crossFadeState:
              ThemeProvider.of(context).brightness == Brightness.dark
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
          firstChild: GestureDetector(
            onTap: () => ThemeSwitcher.of(context).changeTheme(
              theme: ThemeData(
                brightness: Brightness.light,
                fontFamily: 'SFProText',
                primaryColor: Color(0xFFFFFFFF),
                canvasColor: Color(0xFFFFFFFF),
                backgroundColor: Color(0xFFF3F7FB),
                accentColor: Color(0xFFFFC107),
                iconTheme: ThemeData.light().iconTheme.copyWith(
                      color: Color(0xFF373737),
                    ),
                textTheme: ThemeData.light().textTheme.apply(
                      fontFamily: 'SFProText',
                      bodyColor: Color(0xFF373737),
                      displayColor: Color(0xFF373737),
                    ),
              ),
            ),
            child: Icon(
              LineAwesomeIcons.sun,
              size: ScreenUtil().setSp(10.w * 3),
            ),
          ),
          secondChild: GestureDetector(
            onTap: () => ThemeSwitcher.of(context).changeTheme(
              theme: ThemeData(
                brightness: Brightness.dark,
                fontFamily: 'SFProText',
                primaryColor: Color(0xFF212121),
                canvasColor: Color(0xFF212121),
                backgroundColor: Color(0xFF373737),
                accentColor: Color(0xFFFFC107),
                iconTheme: ThemeData.dark().iconTheme.copyWith(
                      color: Color(0xFFF3F7FB),
                    ),
                textTheme: ThemeData.dark().textTheme.apply(
                      fontFamily: 'SFProText',
                      bodyColor: Color(0xFFF3F7FB),
                      displayColor: Color(0xFFF3F7FB),
                    ),
              ),
            ),
            child: Icon(
              LineAwesomeIcons.moon,
              size: ScreenUtil().setSp(10.w * 3),
            ),
          ),
        );
      },
    );

    var header = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(width: 10.w * 3),
        Icon(
          LineAwesomeIcons.arrow_left,
          size: ScreenUtil().setSp(10.w * 3),
        ),
        profileInfo,
        themeSwitcher,
        SizedBox(width: 10.w * 3),
      ],
    );

    return ThemeSwitchingArea(
      child: Builder(
        builder: (context) {
          return Scaffold(
            body: Column(
              children: <Widget>[
                SizedBox(height: 10.w * 5),
                header,
                Expanded(
                  child: ListView(
                    children: <Widget>[
                      ProfileListItem(
                        icon: LineAwesomeIcons.phone,
                        text: '50505050',
                      ),
                      ProfileListItem(
                        icon: LineAwesomeIcons.cog,
                        text: 'Settings',
                      ),
                      ProfileListItem(
                        icon: LineAwesomeIcons.alternate_sign_out,
                        text: 'Logout',
                        hasNavigation: false,
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
