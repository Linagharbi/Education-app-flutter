import 'package:education_app/src/screens/menus/lessons/menu_down.dart';
import 'package:education_app/src/screens/menus/lessons/search_bar.dart';
import 'package:education_app/src/screens/pages/home.dart';
import 'package:flutter/material.dart';

class Lessons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LessonsPage(),
      routes: {
        '/menu': (context) => Menu(),
      },
    );
  }
}

class LessonsPage extends StatefulWidget {
  @override
  _LessonsPageState createState() => _LessonsPageState();
}

class _LessonsPageState extends State<LessonsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff4f6fd),
      body: Container(
        padding: EdgeInsets.only(top: 40, left: 30, right: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                // SearchBox(onChanged: (value) {}),
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(),
                      ),
                    );
                  },
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Color(0xff2657ce),
                  ),
                ),
                Text(
                  "Cours",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.blueAccent,
                  ),
                ),
                Container(
                  height: 25,
                  width: 25,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage('assets/images/profilePic.png'),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            SearchBar(),
            SizedBox(height: 1),
            // Text(
            //   'What do you want to learn today?',
            //   style: TextStyle(
            //       fontSize: 27, height: 1.3, fontWeight: FontWeight.w700),
            // ),
            SizedBox(
              height: 5,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          courseWidget(
                            'Mme Saadi Sara',
                            'Math',
                            'img1',
                            Color(0xffff6a65),
                            Color(0xffff5954),
                          ),
                          SizedBox(
                            height: 18,
                          ),
                          courseWidget(
                            'Mr Salmi Tarek ',
                            'Physique',
                            'img2',
                            Color(0xffe9eefa),
                            Colors.white,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          SizedBox(
                            height: 50,
                          ),
                          courseWidget(
                            'Mme Nazi Rim',
                            'Arabe',
                            'img3',
                            Color(0xffe9eefa),
                            Colors.white,
                          ),
                          SizedBox(
                            height: 18,
                          ),
                          courseWidget(
                            'Mr Gharbi Salih',
                            'Anglais',
                            'img4',
                            Color(0xffbdcddfa),
                            Color(0xffcedaff),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            // Container(
            //   padding: EdgeInsets.all(20),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: <Widget>[
            //       IconButton(
            //         icon: Icon(
            //           Icons.subscriptions,
            //           color: Color(0xff2657ce),
            //           size: 30,
            //         ),
            //       ),
            //       IconButton(
            //         icon: Icon(
            //           Icons.play_circle_filled,
            //           color: Color(0xff2657ce).withOpacity(0.5),
            //           size: 30,
            //         ),
            //       ),
            //       IconButton(
            //         icon: Icon(
            //           Icons.account_circle,
            //           color: Color(0xff2657ce).withOpacity(0.5),
            //           size: 30,
            //         ),
            //       ),
            //     ],
            //   ),
            // )
          ],
        ),
      ),
    );
  }

  Container courseWidget(String teacher, String title, String img,
      Color teacherColor, Color bgColor) {
    return Container(
      padding: EdgeInsets.only(top: 20, left: 13, right: 13, bottom: 10),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.all(Radius.circular(30)),
      ),
      child: InkWell(
        onTap: () {
          openCoursePage('$teacher', '$img', '$title');
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: teacherColor,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Text(
                '$teacher',
                style: TextStyle(
                    color: (teacherColor == Color(0xffe9eefa)
                        ? Color(0xff2657ce)
                        : Colors.white)),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              '$title',
              style: TextStyle(
                color: (bgColor == Color(0xffff5954))
                    ? Colors.white
                    : Colors.black,
                fontSize: 18,
                height: 1,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: <Widget>[
                Container(
                  height: 5,
                  width: 100,
                  color: (bgColor == Color(0xffff5954))
                      ? Colors.red
                      : Color(0xff2657ce),
                ),
                Expanded(
                  child: Container(
                    height: 5,
                    color: (bgColor == Color(0xffff5954))
                        ? Colors.white.withOpacity(0.5)
                        : Color(0xff2657ce).withOpacity(0.5),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Hero(
              tag: '$img',
              child: Container(
                height: 80,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/images/$img.png',
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void openCoursePage(String teacher, String img, String title) {
    Navigator.pushNamed(
      context,
      '/menu',
      arguments: {'teacher': '$teacher', 'img': '$img', 'title': '$title'},
    );
  }
}
