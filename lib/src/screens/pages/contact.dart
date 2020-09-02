import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:education_app/src/screens/bloc_navigation/navigation_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactPage extends StatefulWidget with NavigationStates {
  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
      initTheme: ThemeData(
        brightness: Brightness.light,
        fontFamily: 'SFProText',
        primaryColor: Color(0xFFFFFFFF),
        canvasColor: Color(0xFFFFFFFF),
        backgroundColor: Color(0xFFF3F7FB),
        accentColor: Color(0xFFFFC107),
        iconTheme: ThemeData.dark().iconTheme.copyWith(
              color: Color(0xFF373737),
            ),
        textTheme: ThemeData.dark().textTheme.apply(
              fontFamily: 'SFProText',
              bodyColor: Color(0xFF373737),
              displayColor: Color(0xFF373737),
            ),
      ),
      child: Builder(
        builder: (context) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeProvider.of(context),
            home: ProfileScreen(),
          );
        },
      ),
    );
  }
}

Future<void> makeCall(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

Future<void> launchBrowser(String url) async {
  if (await canLaunch(url)) {
    await launch(url,
        forceSafariVC: false,
        forceWebView: false,
        headers: <String, String>{'my_header_key': 'my_header_value'});
  } else {
    throw 'Could not launch $url';
  }
}

Future<void> sendMail(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

Future<void> openMap(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

// _openURL() async {
//   const url = 'https://www.ise-college-lycee.com/';
//   if (await canLaunch(url)) {
//     await launch(url);
//   } else {
//     throw 'Could not launch $url';
//   }
// }

_facebookURL(String $profileName) async {
  var url = 'https://www.facebook.com/ISEcollegelycee';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

class ProfileScreen extends StatelessWidget {
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
                  backgroundImage: AssetImage('assets/images/logo.png'),
                ),
              ],
            ),
          ),
          SizedBox(height: 10.w * 2),
          Text(
            'ISE Collège & Lycée',
            style: TextStyle(
              fontSize: ScreenUtil().setSp(10.w * 1.7),
              fontWeight: FontWeight.w600,
              color: Color(0xFF212121),
            ),
          ),
          SizedBox(height: 10.w * 2),
        ],
      ),
    );

    var header = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(width: 10.w * 3),
        profileInfo,
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
              Container(
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
                        padding: EdgeInsets.only(
                          left: 20,
                          top: 10,
                          bottom: 10,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Icon(FontAwesomeIcons.phone,
                                    color: Colors.yellow[700], size: 18.0),
                                SizedBox(width: 14.0),
                                InkWell(
                                  child: Text(
                                    "Numéro téléphone",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 16.0),
                                  ),
                                  onTap: () {
                                    makeCall('tel:+21699555222');
                                  },
                                ),
                              ],
                            ),
                            SizedBox(height: 11.0),
                            Row(
                              children: <Widget>[
                                Icon(FontAwesomeIcons.link,
                                    color: Colors.yellow[700], size: 18.0),
                                SizedBox(width: 14.0),
                                InkWell(
                                  child: Text(
                                    "Site Web",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 16.0),
                                  ),
                                  onTap: () {
                                    launchBrowser(
                                        'https://www.ise-college-lycee.com/');
                                  },
                                ),
                              ],
                            ),
                            SizedBox(height: 11.0),
                            Row(
                              children: <Widget>[
                                Icon(FontAwesomeIcons.mailBulk,
                                    color: Colors.yellow[700], size: 18.0),
                                SizedBox(width: 14.0),
                                InkWell(
                                  child: Text(
                                    "Gmail",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 16.0),
                                  ),
                                  onTap: () {
                                    sendMail("mailto:linagharbi8@gmail.com?");
                                  },
                                ),
                              ],
                            ),
                            SizedBox(height: 11.0),
                            Row(
                              children: <Widget>[
                                Icon(FontAwesomeIcons.mapMarker,
                                    color: Colors.yellow[700], size: 18.0),
                                SizedBox(width: 14.0),
                                InkWell(
                                  child: Text(
                                    "Localisation",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 16.0),
                                  ),
                                  onTap: () {
                                    openMap(
                                        'https://www.google.com/maps/place/Ise+Middle+School+High+School/@36.4441716,10.7226932,17z/data=!3m1!4b1!4m5!3m4!1s0x1302997a09478911:0xc0aa4e0e2087b56d!8m2!3d36.4441673!4d10.7248819');
                                  },
                                ),
                              ],
                            ),
                            SizedBox(height: 11.0),
                            Row(
                              children: <Widget>[
                                Icon(FontAwesomeIcons.facebook,
                                    color: Colors.yellow[700], size: 18.0),
                                SizedBox(width: 14.0),
                                InkWell(
                                  child: Text(
                                    "Facebook",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 16.0),
                                  ),
                                  onTap: () {
                                    _facebookURL("ise");
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ));
        },
      ),
    );
  }
}
